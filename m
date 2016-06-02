From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] gpio: userspace ABI for reading GPIO line events
Date: Thu,  2 Jun 2016 13:51:28 +0200
Message-ID: <1464868289-1766-3-git-send-email-linus.walleij@linaro.org>
References: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36541 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751776AbcFBLvy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2016 07:51:54 -0400
Received: by mail-lf0-f41.google.com with SMTP id b73so32144507lfb.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2016 04:51:53 -0700 (PDT)
In-Reply-To: <1464868289-1766-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

This adds an ABI for listening to events on GPIO lines.
The mechanism returns an anonymous file handle to a request
to listen to a specific offset on a specific gpiochip.
To fetch the stream of events from the file handle, userspace
simply reads an event.

- Events can be requested with the same flags as ordinary
  handles, i.e. open drain or open source. An ioctl() call
  GPIO_GET_LINEEVENT_IOCTL is issued indicating the desired
  line.

- Events can be requested for falling edge events, rising
  edge events, or both.

- All events are timestamped using the kernel real time
  nanosecond timestamp (the same as is used by IIO).

- The supplied consumer label will appear in "lsgpio"
  listings of the lines, and in /proc/interrupts as the
  mechanism will request an interrupt from the gpio chip.

- Events are not supported on gpiochips that do not serve
  interrupts (no legal .to_irq() call). The event interrupt
  is threaded to avoid any realtime problems.

- It is possible to also directly read the current value
  of the registered GPIO line by issuing the same
  GPIOHANDLE_GET_LINE_VALUES_IOCTL as used by the
  line handles. Setting the value is not supported: we
  do not listen to events on output lines.

This ABI is strongly influenced by Industrial I/O and surpasses
the old sysfs ABI by providing proper precision timestamps,
making it possible to set flags like open drain, and put
consumer names on the GPIO lines.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c    | 298 ++++++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/gpio.h |  54 ++++++++-
 2 files changed, 347 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8cfb06410ba7..d034d1659fe3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -22,6 +22,9 @@
 #include <linux/uaccess.h>
 #include <linux/compat.h>
 #include <linux/anon_inodes.h>
+#include <linux/kfifo.h>
+#include <linux/poll.h>
+#include <linux/timekeeping.h>
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
@@ -501,6 +504,299 @@ out_free_lh:
 	return ret;
 }
 
+/*
+ * GPIO line event management
+ */
+
+/**
+ * struct lineevent_state - contains the state of a userspace event
+ * @gdev: the GPIO device the event pertains to
+ * @label: consumer label used to tag descriptors
+ * @desc: the GPIO descriptor held by this event
+ * @eflags: the event flags this line was requested with
+ * @irq: the interrupt that trigger in response to events on this GPIO
+ * @wait: wait queue that handles blocking reads of events
+ * @events: KFIFO for the GPIO events
+ * @read_lock: mutex lock to protect reads from colliding with adding
+ * new events to the FIFO
+ */
+struct lineevent_state {
+	struct gpio_device *gdev;
+	const char *label;
+	struct gpio_desc *desc;
+	u32 eflags;
+	int irq;
+	wait_queue_head_t wait;
+	DECLARE_KFIFO(events, struct gpioevent_data, 16);
+	struct mutex read_lock;
+};
+
+static unsigned int lineevent_poll(struct file *filep,
+				   struct poll_table_struct *wait)
+{
+	struct lineevent_state *le = filep->private_data;
+	unsigned int events = 0;
+
+	poll_wait(filep, &le->wait, wait);
+
+	if (!kfifo_is_empty(&le->events))
+		events = POLLIN | POLLRDNORM;
+
+	return events;
+}
+
+
+static ssize_t lineevent_read(struct file *filep,
+			      char __user *buf,
+			      size_t count,
+			      loff_t *f_ps)
+{
+	struct lineevent_state *le = filep->private_data;
+	unsigned int copied;
+	int ret;
+
+	if (count < sizeof(struct gpioevent_data))
+		return -EINVAL;
+
+	do {
+		if (kfifo_is_empty(&le->events)) {
+			if (filep->f_flags & O_NONBLOCK)
+				return -EAGAIN;
+
+			ret = wait_event_interruptible(le->wait,
+					!kfifo_is_empty(&le->events));
+			if (ret)
+				return ret;
+		}
+
+		if (mutex_lock_interruptible(&le->read_lock))
+			return -ERESTARTSYS;
+		ret = kfifo_to_user(&le->events, buf, count, &copied);
+		mutex_unlock(&le->read_lock);
+
+		if (ret)
+			return ret;
+
+		/*
+		 * If we couldn't read anything from the fifo (a different
+		 * thread might have been faster) we either return -EAGAIN if
+		 * the file descriptor is non-blocking, otherwise we go back to
+		 * sleep and wait for more data to arrive.
+		 */
+		if (copied == 0 && (filep->f_flags & O_NONBLOCK))
+			return -EAGAIN;
+
+	} while (copied == 0);
+
+	return copied;
+}
+
+static int lineevent_release(struct inode *inode, struct file *filep)
+{
+	struct lineevent_state *le = filep->private_data;
+	struct gpio_device *gdev = le->gdev;
+
+	free_irq(le->irq, le);
+	gpiod_free(le->desc);
+	kfree(le->label);
+	kfree(le);
+	put_device(&gdev->dev);
+	return 0;
+}
+
+static long lineevent_ioctl(struct file *filep, unsigned int cmd,
+			    unsigned long arg)
+{
+	struct lineevent_state *le = filep->private_data;
+	void __user *ip = (void __user *)arg;
+	struct gpiohandle_data ghd;
+
+	/*
+	 * We can get the value for an event line but not set it,
+	 * because it is input by definition.
+	 */
+	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
+		int val;
+
+		val = gpiod_get_value_cansleep(le->desc);
+		if (val < 0)
+			return val;
+		ghd.values[0] = val;
+
+		if (copy_to_user(ip, &ghd, sizeof(ghd)))
+			return -EFAULT;
+
+		return 0;
+	}
+	return -EINVAL;
+}
+
+#ifdef CONFIG_COMPAT
+static long lineevent_ioctl_compat(struct file *filep, unsigned int cmd,
+				   unsigned long arg)
+{
+	return lineevent_ioctl(filep, cmd, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static const struct file_operations lineevent_fileops = {
+	.release = lineevent_release,
+	.read = lineevent_read,
+	.poll = lineevent_poll,
+	.owner = THIS_MODULE,
+	.llseek = noop_llseek,
+	.unlocked_ioctl = lineevent_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = lineevent_ioctl_compat,
+#endif
+};
+
+irqreturn_t lineevent_irq_thread(int irq, void *p)
+{
+	struct lineevent_state *le = p;
+	struct gpioevent_data ge;
+	int ret;
+
+	ge.timestamp = ktime_get_real_ns();
+
+	if (le->eflags & GPIOEVENT_REQUEST_BOTH_EDGES) {
+		int level = gpiod_get_value_cansleep(le->desc);
+
+		if (level)
+			/* Emit low-to-high event */
+			ge.id = GPIOEVENT_EVENT_RISING_EDGE;
+		else
+			/* Emit high-to-low event */
+			ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
+	} else if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE) {
+		/* Emit low-to-high event */
+		ge.id = GPIOEVENT_EVENT_RISING_EDGE;
+	} else if (le->eflags & GPIOEVENT_REQUEST_FALLING_EDGE) {
+		/* Emit high-to-low event */
+		ge.id = GPIOEVENT_EVENT_FALLING_EDGE;
+	}
+
+	ret = kfifo_put(&le->events, ge);
+	if (ret != 0)
+		wake_up_poll(&le->wait, POLLIN);
+
+	return IRQ_HANDLED;
+}
+
+static int lineevent_create(struct gpio_device *gdev, void __user *ip)
+{
+	struct gpioevent_request eventreq;
+	struct lineevent_state *le;
+	struct gpio_desc *desc;
+	u32 offset;
+	u32 lflags;
+	u32 eflags;
+	int fd;
+	int ret;
+	int irqflags = 0;
+
+	if (copy_from_user(&eventreq, ip, sizeof(eventreq)))
+		return -EFAULT;
+
+	le = kzalloc(sizeof(*le), GFP_KERNEL);
+	if (!le)
+		return -ENOMEM;
+	le->gdev = gdev;
+	get_device(&gdev->dev);
+
+	/* Make sure this is terminated */
+	eventreq.consumer_label[sizeof(eventreq.consumer_label)-1] = '\0';
+	if (strlen(eventreq.consumer_label)) {
+		le->label = kstrdup(eventreq.consumer_label,
+				    GFP_KERNEL);
+		if (!le->label) {
+			ret = -ENOMEM;
+			goto out_free_le;
+		}
+	}
+
+	offset = eventreq.lineoffset;
+	lflags = eventreq.handleflags;
+	eflags = eventreq.eventflags;
+
+	/* This is just wrong: we don't look for events on output lines */
+	if (lflags & GPIOHANDLE_REQUEST_OUTPUT) {
+		ret = -EINVAL;
+		goto out_free_label;
+	}
+
+	desc = &gdev->descs[offset];
+	ret = gpiod_request(desc, le->label);
+	if (ret)
+		goto out_free_desc;
+	le->desc = desc;
+	le->eflags = eflags;
+
+	if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
+		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN)
+		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+	if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
+		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+
+	ret = gpiod_direction_input(desc);
+	if (ret)
+		goto out_free_desc;
+
+	le->irq = gpiod_to_irq(desc);
+	if (le->irq <= 0) {
+		ret = -ENODEV;
+		goto out_free_desc;
+	}
+
+	if (eflags & GPIOEVENT_REQUEST_RISING_EDGE)
+		irqflags |= IRQF_TRIGGER_RISING;
+	if (eflags & GPIOEVENT_REQUEST_FALLING_EDGE)
+		irqflags |= IRQF_TRIGGER_FALLING;
+	irqflags |= IRQF_ONESHOT;
+	irqflags |= IRQF_SHARED;
+
+	INIT_KFIFO(le->events);
+	init_waitqueue_head(&le->wait);
+	mutex_init(&le->read_lock);
+
+	/* Request a thread to read the events */
+	ret = request_threaded_irq(le->irq,
+			NULL,
+			lineevent_irq_thread,
+			irqflags,
+			le->label,
+			le);
+	if (ret)
+		goto out_free_desc;
+
+	fd = anon_inode_getfd("gpio-event",
+			      &lineevent_fileops,
+			      le,
+			      O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		ret = fd;
+		goto out_free_irq;
+	}
+
+	eventreq.fd = fd;
+	if (copy_to_user(ip, &eventreq, sizeof(eventreq)))
+		return -EFAULT;
+
+	return 0;
+
+out_free_irq:
+	free_irq(le->irq, le);
+out_free_desc:
+	gpiod_free(le->desc);
+out_free_label:
+	kfree(le->label);
+out_free_le:
+	kfree(le);
+	put_device(&gdev->dev);
+	return ret;
+}
+
 /**
  * gpio_ioctl() - ioctl handler for the GPIO chardev
  */
@@ -578,6 +874,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return 0;
 	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
 		return linehandle_create(gdev, ip);
+	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
+		return lineevent_create(gdev, ip);
 	}
 	return -EINVAL;
 }
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 21905531dcf4..333d3544c964 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -55,7 +55,7 @@ struct gpioline_info {
 /* Maximum number of requested handles */
 #define GPIOHANDLES_MAX 64
 
-/* Request flags */
+/* Linerequest flags */
 #define GPIOHANDLE_REQUEST_INPUT	(1UL << 0)
 #define GPIOHANDLE_REQUEST_OUTPUT	(1UL << 1)
 #define GPIOHANDLE_REQUEST_ACTIVE_LOW	(1UL << 2)
@@ -93,10 +93,6 @@ struct gpiohandle_request {
 	int fd;
 };
 
-#define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
-#define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
-#define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
-
 /**
  * struct gpiohandle_data - Information of values on a GPIO handle
  * @values: when getting the state of lines this contains the current
@@ -110,4 +106,52 @@ struct gpiohandle_data {
 #define GPIOHANDLE_GET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x08, struct gpiohandle_data)
 #define GPIOHANDLE_SET_LINE_VALUES_IOCTL _IOWR(0xB4, 0x09, struct gpiohandle_data)
 
+/* Eventrequest flags */
+#define GPIOEVENT_REQUEST_RISING_EDGE	(1UL << 0)
+#define GPIOEVENT_REQUEST_FALLING_EDGE	(1UL << 1)
+#define GPIOEVENT_REQUEST_BOTH_EDGES	((1UL << 0) | (1UL << 1))
+
+/**
+ * struct gpioevent_request - Information about a GPIO event request
+ * @lineoffset: the desired line to subscribe to events from, specified by
+ * offset index for the associated GPIO device
+ * @handleflags: desired handle flags for the desired GPIO line, such as
+ * GPIOHANDLE_REQUEST_ACTIVE_LOW or GPIOHANDLE_REQUEST_OPEN_DRAIN
+ * @eventflags: desired flags for the desired GPIO event line, such as
+ * GPIOEVENT_REQUEST_RISING_EDGE or GPIOEVENT_REQUEST_FALLING_EDGE
+ * @consumer_label: a desired consumer label for the selected GPIO line(s)
+ * such as "my-listener"
+ * @fd: if successful this field will contain a valid anonymous file handle
+ * after a GPIO_GET_LINEEVENT_IOCTL operation, zero or negative value
+ * means error
+ */
+struct gpioevent_request {
+	__u32 lineoffset;
+	__u32 handleflags;
+	__u32 eventflags;
+	char consumer_label[32];
+	int fd;
+};
+
+/**
+ * GPIO event types
+ */
+#define GPIOEVENT_EVENT_RISING_EDGE 0x01
+#define GPIOEVENT_EVENT_FALLING_EDGE 0x02
+
+/**
+ * struct gpioevent_data - The actual event being pushed to userspace
+ * @timestamp: best estimate of time of event occurrence, in nanoseconds
+ * @id: event identifier
+ */
+struct gpioevent_data {
+	__u64 timestamp;
+	__u32 id;
+};
+
+#define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
+#define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
+#define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
+#define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
+
 #endif /* _UAPI_GPIO_H_ */
-- 
2.4.11

