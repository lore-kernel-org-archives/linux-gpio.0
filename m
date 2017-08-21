From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/4] bitops: Introduce assign_bit()
Date: Mon, 21 Aug 2017 15:12:00 +0200
Message-ID: <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
References: <cover.1503319573.git.lukas@wunner.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout3.hostsharing.net ([176.9.242.54]:37017 "EHLO
        mailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753110AbdHUNMW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2017 09:12:22 -0400
In-Reply-To: <cover.1503319573.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org, Bart Van Assche <bart.vanassche@wdc.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>

A common idiom is to assign a value to a bit with:

    if (value)
        set_bit(nr, addr);
    else
        clear_bit(nr, addr);

Likewise common is the one-line expression variant:

    value ? set_bit(nr, addr) : clear_bit(nr, addr);

Commit 9a8ac3ae682e ("dm mpath: cleanup QUEUE_IF_NO_PATH bit
manipulation by introducing assign_bit()") introduced assign_bit()
to the md subsystem for brevity.

Make it available to others, in particular gpiolib and the upcoming
driver for Maxim MAX3191x industrial serializer chips.

Cc: Bart Van Assche <bart.vanassche@wdc.com>
Cc: Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/md/dm-mpath.c  |  8 --------
 include/linux/bitops.h | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 0e8ab5bb3575..c79c113b7e7d 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -638,14 +638,6 @@ static void process_queued_bios(struct work_struct *work)
 	blk_finish_plug(&plug);
 }
 
-static void assign_bit(bool value, long nr, unsigned long *addr)
-{
-	if (value)
-		set_bit(nr, addr);
-	else
-		clear_bit(nr, addr);
-}
-
 /*
  * If we run out of usable paths, should we queue I/O or error it?
  */
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index a83c822c35c2..097af36887c0 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -226,6 +226,30 @@ static inline unsigned long __ffs64(u64 word)
 	return __ffs((unsigned long)word);
 }
 
+/**
+ * assign_bit - Assign value to a bit in memory
+ * @value: the value to assign
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ */
+static __always_inline void assign_bit(bool value, long nr,
+				       volatile unsigned long *addr)
+{
+	if (value)
+		set_bit(nr, addr);
+	else
+		clear_bit(nr, addr);
+}
+
+static __always_inline void __assign_bit(bool value, long nr,
+					 volatile unsigned long *addr)
+{
+	if (value)
+		__set_bit(nr, addr);
+	else
+		__clear_bit(nr, addr);
+}
+
 #ifdef __KERNEL__
 
 #ifndef set_mask_bits
-- 
2.11.0

