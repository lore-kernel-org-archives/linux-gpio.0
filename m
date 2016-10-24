From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] gpio: GPIO_GET_LINE{HANDLE,EVENT}_IOCTL: Fix file descriptor leak
Date: Mon, 24 Oct 2016 13:59:15 +0200
Message-ID: <1477310355-16878-1-git-send-email-lars@metafoo.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www381.your-server.de ([78.46.137.84]:41262 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755851AbcJXL7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2016 07:59:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

When allocating a new line handle or event a file is allocated that it is
associated to. The file is attached to a file descriptor of the current
process and the file descriptor is returned to userspace using
copy_to_user(). If this copy operation fails the line handle or event
allocation is aborted, all acquired resources are freed and an error is
returned.

But the file struct is not freed and left attached to the userspace
application and even though the file descriptor number was not copied it is
trivial to guess. If a userspace application performs a IOCTL on such a
left over file descriptor it will trigger a use-after-free and if the file
descriptor is closed (latest when the application exits) a double-free is
triggered.

anon_inode_getfd() performs 3 tasks, allocate a file struct, allocate a
file descriptor for the current process and install the file struct in the
file descriptor. As soon as the file struct is installed in the file
descriptor it is accessible by userspace (even if the IOCTL itself hasn't
completed yet), this means uninstalling the fd on the error path is not an
option, since userspace might already got a reference to the file.

Instead anon_inode_getfd() needs to be broken into its individual steps.
The allocation of the file struct and file descriptor is done first, then
the copy_to_user() is executed and only if it succeeds the file is
installed.

Since the file struct is reference counted it can not be just freed, but
its reference needs to be dropped, which will also call the release()
callback, which will free the state attached to the file. So in this case
the normal error cleanup path should not be taken.

Fixes: d932cd49182f ("gpio: free handles in fringe cases")
Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/gpio/gpiolib.c | 57 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 20e09b7..93ed0e0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -21,6 +21,7 @@
 #include <linux/uaccess.h>
 #include <linux/compat.h>
 #include <linux/anon_inodes.h>
+#include <linux/file.h>
 #include <linux/kfifo.h>
 #include <linux/poll.h>
 #include <linux/timekeeping.h>
@@ -423,6 +424,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 {
 	struct gpiohandle_request handlereq;
 	struct linehandle_state *lh;
+	struct file *file;
 	int fd, i, ret;
 
 	if (copy_from_user(&handlereq, ip, sizeof(handlereq)))
@@ -499,26 +501,41 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	i--;
 	lh->numdescs = handlereq.lines;
 
-	fd = anon_inode_getfd("gpio-linehandle",
-			      &linehandle_fileops,
-			      lh,
-			      O_RDONLY | O_CLOEXEC);
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
 		goto out_free_descs;
 	}
 
+	file = anon_inode_getfile("gpio-linehandle",
+				  &linehandle_fileops,
+				  lh,
+				  O_RDONLY | O_CLOEXEC);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto out_put_unused_fd;
+	}
+
 	handlereq.fd = fd;
 	if (copy_to_user(ip, &handlereq, sizeof(handlereq))) {
-		ret = -EFAULT;
-		goto out_free_descs;
+		/*
+		 * fput() will trigger the release() callback, so do not go onto
+		 * the regular error cleanup path here.
+		 */
+		fput(file);
+		put_unused_fd(fd);
+		return -EFAULT;
 	}
 
+	fd_install(fd, file);
+
 	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
 		lh->numdescs);
 
 	return 0;
 
+out_put_unused_fd:
+	put_unused_fd(fd);
 out_free_descs:
 	for (; i >= 0; i--)
 		gpiod_free(lh->descs[i]);
@@ -721,6 +738,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	struct gpioevent_request eventreq;
 	struct lineevent_state *le;
 	struct gpio_desc *desc;
+	struct file *file;
 	u32 offset;
 	u32 lflags;
 	u32 eflags;
@@ -815,23 +833,38 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		goto out_free_desc;
 
-	fd = anon_inode_getfd("gpio-event",
-			      &lineevent_fileops,
-			      le,
-			      O_RDONLY | O_CLOEXEC);
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
 		ret = fd;
 		goto out_free_irq;
 	}
 
+	file = anon_inode_getfile("gpio-event",
+				  &lineevent_fileops,
+				  le,
+				  O_RDONLY | O_CLOEXEC);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto out_put_unused_fd;
+	}
+
 	eventreq.fd = fd;
 	if (copy_to_user(ip, &eventreq, sizeof(eventreq))) {
-		ret = -EFAULT;
-		goto out_free_irq;
+		/*
+		 * fput() will trigger the release() callback, so do not go onto
+		 * the regular error cleanup path here.
+		 */
+		fput(file);
+		put_unused_fd(fd);
+		return -EFAULT;
 	}
 
+	fd_install(fd, file);
+
 	return 0;
 
+out_put_unused_fd:
+	put_unused_fd(fd);
 out_free_irq:
 	free_irq(le->irq, le);
 out_free_desc:
-- 
2.1.4

