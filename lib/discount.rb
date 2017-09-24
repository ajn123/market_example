

class Discount
        def initialize(product, code, amount, type, options = {})
          @amount = amount * -1
          @code = code
          @type = type
          @count = 0
          @limit = options.fetch(:limit, 1)
          @for_product = options.fetch(:for_product, "")
        end

        def run_discount(count, item_count)
          case @type
          when :buy_one_get_one_free              
             return buy_one_get_one_free
          when :discount_at_quantity
             return discount_at_quantity(count)      
          when :get_something_free
             return get_something_free(count, item_count)
          else
             return 0
          end
        end

        def buy_one_get_one_free
          if @count % 2 == 1 && @count <= @limit
            puts Product.formatted_discount(@code, @amount)
            @count += 1
            return @amount
          end
          @count += 1
          return 0
        end

        def discount_at_quantity(count)
          if count >= @limit
            puts Product.formatted_discount(@code, @amount)
            return @amount
          end
          return 0
        end

        def get_something_free(count, item_count)
          if count >= @limit && item_count.fetch(@for_product, 0) >= 1 && @limit > 0
            puts Product.formatted_discount(@code, @amount)         
            @limit -= 1
            return @amount
          end
          return 0
        end
        
end