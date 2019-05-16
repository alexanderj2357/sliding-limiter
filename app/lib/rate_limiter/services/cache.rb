# app/lib/rate_limiter/services/cache.rb

module RateLimiter
    class Cache
        attr_reader :cache

        def initialize(cache)
            @cache = cache
        end

        def block_requestor(key, period)
            cache.set(key, 1, period)
        end

        def get_count(key)
            cache.get(key)
        end

        def initialize_requestor(key, value, period)
            cache.set(key, value, period)
        end

        def increment_count(key)
            cache.incr(key)
        end

        def get_cooldown(key)
            cache.ttl(key)
        end
    end
end