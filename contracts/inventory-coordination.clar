;; Inventory Coordination Contract
;; Manages and coordinates merchandising inventory

(define-constant err-unauthorized (err u400))
(define-constant err-insufficient-stock (err u401))
(define-constant err-invalid-product (err u402))
(define-constant err-product-not-found (err u403))

;; Data maps
(define-map inventory-levels uint {
    current-stock: uint,
    min-threshold: uint,
    max-capacity: uint,
    last-updated: uint,
    manager: principal
})

(define-map reorder-requests uint {
    product-id: uint,
    requested-quantity: uint,
    urgency-level: uint,
    request-date: uint,
    manager: principal,
    status: (string-ascii 20)
})

(define-map reorder-counter uint uint)

;; Initialize counter
(map-set reorder-counter u0 u0)

;; Read-only functions
(define-read-only (get-inventory-level (product-id uint))
    (map-get? inventory-levels product-id)
)

(define-read-only (get-reorder-request (request-id uint))
    (map-get? reorder-requests request-id)
)

(define-read-only (needs-reorder (product-id uint))
    (match (map-get? inventory-levels product-id)
        inventory (<= (get current-stock inventory) (get min-threshold inventory))
        false
    )
)

;; Public functions
(define-public (set-inventory-level (product-id uint) (stock uint) (min-threshold uint) (max-capacity uint))
    (begin
        (map-set inventory-levels product-id {
            current-stock: stock,
            min-threshold: min-threshold,
            max-capacity: max-capacity,
            last-updated: block-height,
            manager: tx-sender
        })
        (ok true)
    )
)

(define-public (update-stock (product-id uint) (quantity-change int))
    (match (map-get? inventory-levels product-id)
        inventory (let ((new-stock (if (>= quantity-change 0)
                                      (+ (get current-stock inventory) (to-uint quantity-change))
                                      (if (>= (get current-stock inventory) (to-uint (- quantity-change)))
                                          (- (get current-stock inventory) (to-uint (- quantity-change)))
                                          u0))))
            (begin
                (map-set inventory-levels product-id (merge inventory {
                    current-stock: new-stock,
                    last-updated: block-height
                }))
                (ok new-stock)
            )
        )
        err-product-not-found
    )
)

(define-public (create-reorder-request (product-id uint) (quantity uint) (urgency uint))
    (let ((request-id (+ (default-to u0 (map-get? reorder-counter u0)) u1)))
        (begin
            (map-set reorder-requests request-id {
                product-id: product-id,
                requested-quantity: quantity,
                urgency-level: urgency,
                request-date: block-height,
                manager: tx-sender,
                status: "pending"
            })
            (map-set reorder-counter u0 request-id)
            (ok request-id)
        )
    )
)
