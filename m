Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399828;
	b=QhMXDvhY17snIhP2fhdJOvXiQGr0b+WJpZFroKrxlIpU8pCEe9iCGw1oUIYptGLD/rW4
	 TzcrR3EIXMDpoFJq4Yjoa3YJFTgREYxRk5V0YguMKz5CofQk2F8hJL47e1PoTrBimcpML
	 ciqOOyuqPD/x9heecIdSQ6I6V+3EkzDqO92KjkXxqpWjOjUyHpYdva+9trUtR3qGbtdYN
	 XjnOffxUm8dna8Sjf1EYRcuTreOhCSCNK07iVVCFMEvCrziFCV9pqMXDiLxmMu3hVCiUT
	 Gscjgr0m8nKWhMfSoY6vmHuKFeP8eHRbKtYdIzu55Tj1ngVxtAP+u200FBl3IXhgyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JTE/z18z9ZA/r3X5bUnDyeVPzt0i08fqynrLX8skefw=;
	b=QZ90JLqsrVs3tKZwvupA/UU3cBa5BKhPzu3tqhjMH264Hk7I4RozZQJuGibUNx9Ruyqs
	 JKqyOr7jmJNQK1qMheVhlu0I09/Hk2r++EXd1xYNEchZOJlWNLhM3sHqTfdrSQG+i/2Qx
	 GH80BVpZlX0mSeRfUqn8IkeEIFkvV8AtAx5nH4pAzzECtw7jWWtEGPokCXr/Uv+xWLdqh
	 FG9qNTXqrYztcnnCzl7zcqk+/fhVL5PZCkcigp1WbrJrz0XTV/GI+Lyw4LGgztsc5bTYB
	 wfMdTWftA7aR3X01oZD05pt3vpKqagRlkQXBFKG929e2x9r+R6hOj7UfCAqiByE2GUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3w6AXSB;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1CA606A338
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1CA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3w6AXSB
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e10a70540so775282f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399827; x=1794004627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTE/z18z9ZA/r3X5bUnDyeVPzt0i08fqynrLX8skefw=;
        b=t3w6AXSByaT6gcCicsKZNzDXGesNxngeLdT2vwwdzCcCs1IR7xtfpKb+GpOJq9U5wX
         2JLGFeE4OwjdVSbsSn3mbifgPb9u7qbZELJMKiwpxU3IBl0Z2nM6A0DU/LHUP95h4HJK
         QmGtmN1xuDh4QNHFWnGItjr7LsLrrSqwP0lGdJS8WCngYbAMMBaLDWXOweAyFrg0aqro
         HSPj56YRd4WL/oeZZlMChJM6vYlLe8I2xj/6TWuiIRwtgEu+RdoV1eF5jXFlp7vbNpH/
         +QOEztPSmZp7tGfgw7PczW8kCvE+I/V4oBKbxqO38fgaLfUsjgtfLbqsxVViVIRZBAQm
         dVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399827; x=1794004627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTE/z18z9ZA/r3X5bUnDyeVPzt0i08fqynrLX8skefw=;
        b=1i0L4dwd0p50UZ3CM9NYMpuHyvvBsZbFtFUMmMfyyZBIaHmGq3I04D/LtjGpU41pMn
         gnDeN/SIxbkjobeFryzp5DsBdKcqPlR2MdxVl6YSYa+7hk5WBtA1MoLysJggKcN2SDSA
         TqP2SKoZJzT/AvH6Bu6gMZJMPCDXzULxK+UT7d8pqZbgFXx5KufrSoBe0maJYO81ufWs
         dE18eUFdC4jW9rhNqIbxJktL27vem9H9hJZMwfueM7ARX1khrxlg9DO1XOHkUyLizDze
         RNyS+KoP+iY7FaGhAPW1Jp/PBWJy5LMhZHm69kaMXxWbmppMRKkTO7HKNJjnPOTRdny2
         Ol/w==
X-Forwarded-Encrypted: i=1; AKwUvBwp+3gcGeuBwlf1vj+i8aifFw269b1ZMDUnRK4wwFhM7UAVYULyj0U28Mcrsz2PzQMq7dMCxm1dBkUN@vger.kernel.org
X-Gm-Message-State: AFq9FYIECMqlBt/2y4L/QD2/1FmgMxC7CDopB3p01t3no+UV3GDoB7oi
	pAgJkP3PWDNGJjhl5sqQxReVitOxvtykQ9LOips+wGcETjyACm6BqF7K
X-Gm-Gg: AYBFou35yePA8CJEJj5Qq4L8QM0vBvTHWYBergdCRSneR9a83Fh7rB+dDtSf3Mtj7XJ
	Ol0LkEhzVdCpqIi7OUDgs8TeLJL77OHnZ3rk6vWUuC+YRplGECQigLIrthJ8yE0baEOoTrt8ERp
	ID+VXPFI1+WZjgyy7UNEDoLhuUoUwVEHnPsfgRvjHBXnkFIoRZV3FkMa+7pdPHDVB0J90LcGURP
	woTkn4kn3liX5vz93Fh5Dq4ZtAU8PqXbkgTFJxuOROHAAqPO3IFSGmj5JDO0rgWqPFxD1jHBtEU
	r22RN8WAgmbO5B7lx6G5Ag3eyln03EWjcm8YSdCKvQIIXr2HEKk2aMeZHhsl0/ie9feUIP+utiL
	GQ7A5eKX9ga0/tEZeE6Wgjr9kKysx3PebMs7/NLGfHIsnu1vqwOW3x+qDOq3cTPQfjbQOokss4c
	CPh7GCjVjImnEOUGebzaaGi9HGVLzrgLxulQw9M7YyUm8jmLCDk/POfPmaIORagaDGC1zufDYpV
	FJhAAQhkcfVkZlXoVhDKrmAv1gLXpOgc+V+1HggcB05/gbKkoKbS2lv7UFiWRDw+LgHU0tdOOBm
	TAudYWQ/RM2UN2Ily7XfzHsHD2mhHabYZoqCYlpUKLR2OpF7tA==
X-Received: by 2002:a05:6000:2886:b0:48b:1119:5756 with SMTP id ffacd0b85a97d-48e6e2f6739mr8445762f8f.17.1793399826540;
        Fri, 30 Oct 2026 15:37:06 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:06 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 04/15] HID: ft260: i2c: reduce driver module loading time
Date: Sat, 31 Oct 2026 00:36:26 +0200
Message-ID: <20261030223637.86907-5-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HWMON class I2C client drivers register the address range to scan
during the I2C master module probing. For example, the lm75 module
registers eight bus addresses scanned during the ft260 module loading.

In the case of ft260, the bus is scanned by ft260_i2c_read, but due to
an excessive read completion timeout, it took about 40 seconds for the
ft260 driver to scan the lm75 address range before exiting the probe
function.

Adjust the i2c_read timeout so it depends on the amount of data to
read, reducing the lm75 address range scan time to about 200ms.

The 25 ms per-report budget was checked on a UMFT260EV1A with a 24LC512
EEPROM by shrinking the timeout until reads began to fail: a 60-byte
read still completes at 9 ms and times out at 7 ms, against 5.4 ms of
wire time at 100 kHz, so the fixed USB, HID and scheduling overhead
costs a few milliseconds. At the chip's slowest 60 kHz clock that chunk
needs about 9 ms on the wire and a 180-byte chunk about 27 ms. Scale
the wait by 25 ms per 60-byte HID payload so a last chunk of 61..180
bytes gets 50..75 ms, not the single-report 25 ms budget (reported by
Sashiko).

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2: last I2C read chunk timeout from rd_len (reported by Sashiko).
---
 drivers/hid/hid-ft260.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index e24f3151fdaf..f134fab08285 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -17,6 +17,7 @@
 #include <linux/serial_core.h>
 #include <linux/kfifo.h>
 #include <linux/tty_flip.h>
+#include <linux/math.h>
 #include <linux/minmax.h>
 #include <linux/unaligned.h>
 #include <linux/bits.h>
@@ -49,14 +50,20 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
  * The ft260 input report format defines 62 bytes for the data payload, but
  * when requested 62 bytes, the controller returns 60 and 2 in separate input
  * reports. To achieve better performance with the multi-report read data
- * transfers, we set the maximum read payload length to a multiple of 60.
+ * transfers, we set the maximum read payload length to a multiple of
+ * FT260_RD_ONE_REPORT_MAX.
  * With a 100 kHz I2C clock, one 240 bytes read takes about 1/27 second,
  * which is excessive; On the other hand, some higher layer drivers like at24
  * or optoe limit the i2c reads to 128 bytes. To not block other drivers out
  * of I2C for potentially troublesome amounts of time, we select the maximum
  * read payload length to be 180 bytes.
  */
+#define FT260_RD_ONE_REPORT_MAX 60
 #define FT260_RD_DATA_MAX 180
+
+/* Time in ms to wait for a single HID input report at ONE_REPORT_MAX */
+#define FT260_RD_ONE_REPORT_TO 25
+
 #define FT260_WR_I2C_DATA_MAX 60
 #define FT260_WR_UART_DATA_MAX 62
 #define FT260_GPIOCHIP "ft260_gpio"
@@ -722,8 +729,8 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			  u16 len, u8 flag)
 {
 	u16 rd_len;
-	u16 rd_data_max = 60;
-	int timeout, ret = 0;
+	u16 rd_data_max = FT260_RD_ONE_REPORT_MAX;
+	int timeout, timeout_jiffies, ret = 0;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
 	unsigned long irqflags;
@@ -748,6 +755,8 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 		} else {
 			rd_len = rd_data_max;
 		}
+		timeout = FT260_RD_ONE_REPORT_TO *
+			  DIV_ROUND_UP(rd_len, FT260_RD_ONE_REPORT_MAX);
 		rd_data_max = FT260_RD_DATA_MAX;
 
 		rep.report = FT260_I2C_READ_REQ;
@@ -772,8 +781,8 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			goto ft260_i2c_read_exit;
 		}
 
-		timeout = msecs_to_jiffies(5000);
-		if (!wait_for_completion_timeout(&dev->wait, timeout)) {
+		timeout_jiffies = msecs_to_jiffies(timeout);
+		if (!wait_for_completion_timeout(&dev->wait, timeout_jiffies)) {
 			ret = -ETIMEDOUT;
 			ft260_i2c_reset(hdev);
 			goto ft260_i2c_read_exit;
-- 
2.43.0

