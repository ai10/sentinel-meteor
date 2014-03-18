Sentinel
===


     Sentinel = @Sentinel = {}

     Sentinel.allow = (locks)->
         keys = Meteor.user()?.sentinels
         if _.isArray locks
             intersection = _.intersection locks, keys
             if intersection.length > 0 then return true
             return false
         if _.contains keys, locks then return true
         false

     if Meteor.isServer
         Meteor.publish "userData", ->
             Meteor.users.find { 
                 _id: @userId 
             }, { 
                 fields: { 'sentinels': 1 }
             }

         Sentinel.entrust = (userId, lock)->
             Meteor.users.update { 
                 _id: userId 
             }, { 
                 $addToSet: { 'sentinels': lock }
             }
             uu = Meteor.users.findOne userId
             console.log 'user', uu
