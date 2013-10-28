
enum
  {
    LOG_DAEMON = (3<<3)
  };

enum
  {
    LOG_PID = 0x01
  };

enum
  {
    LOG_CRIT,
    LOG_ERR,
    LOG_WARNING,
    LOG_NOTICE,
    LOG_INFO,
    LOG_DEBUG,
  };

#define syslog(prio, fmt, args...) grub_dprintf ("syslog", fmt, ##args)

#define openlog(x,y,z)
#define closelog()
