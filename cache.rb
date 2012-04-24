class Cache
    @@cache = {}

    def self.cache_connection_for(user, connection)
        @@cache[user] = connection
    end

    def self.remove_connection_for(user)
        @@cache.delete(user)
    end

    def self.get_connection_for(user)
        return @@cache[user]
    end

    def self.connection_cached_for?(user)
        return @@cache.has_key?(user)
    end

    def self.who_is_connected?()
        return @@cache.keys
    end
end
