Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697722;
	b=BjCGTKTGG6q5bb0YP2lDLWlArFFoDqT4MJ0xLaEQFJiqLHoknrQLNKZMsgdydvNRx6+p
	 Rcg8QK3Y8L6U8xwSwYwZ3V6gCaskLLX2ielv0tC1xWtiCLVqqS/ICdPEwPKqU0KxYjSIi
	 PF7y/cYQ8CtX+0eaRTaXOIwzp5BH121tvF8aaAc0qOqz53U45KxmV8iEN5VLkU00oXlJ2
	 Ac3eXLmf7Hl2OSQLlrF2aoU1ExVpYj3dCd/+CcHyGaN6kfNlBzxILKrSpx8pXnLvWvTnB
	 AQAlcMv/RaLom2mFTOA8QsWSA2rFsSCNMDeZ0ZZmJ3gek6rEj4aXCRz8vQQneJlCo7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OWq1ZPhXVsQ8TnLGQfYbZB9MhFN53DcQmkdOU8DAzLM=;
	b=Nl7s3+funJBPBDvWFRoVx6xINtuma2GF9j6bna5ksV2H5mrWXzY1DrXaPZdB4WjaMg+G
	 Ss8J7Lyx1Ft7Q2c8dga3wM1CDlyJYOWhzP945TEnlqjYzvRgPA01UrfMR9x0jaB5PEe4U
	 umhoGdH6RcvLJ5ZSmb3mkvkx6uI3j/S7uqXcGUAoY871AWwwvthcrKRYMmW0xkfVQuA9Q
	 U3yWQIPGmg3QCrKqlvy12eW0sNLtPbdxcCo5OwViOi3Fy6pi+2XpvHq8rmU7OPwJH2Hv9
	 3JAW1Z7E8ZrqZbT51Lv6dGJI1E42n37qK6kSuR8cIgJDynfqXmwAp9jAnpq3Hjj0TEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2x4AYJG;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43780606A898
	for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 23:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43780606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j2x4AYJG
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so3378155e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 15:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794697721; x=1795302521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWq1ZPhXVsQ8TnLGQfYbZB9MhFN53DcQmkdOU8DAzLM=;
        b=j2x4AYJG6n6Db9GW977oMzXHN7UsiOwbhnKGYzeeISR1q9eapPvmbYFZYhSzsWSPuW
         p1CKAdFyMmXR+i3GSjxLKah+pfHWNHAS9AVTE4YwlG6Micg5x5ZVyN4gbg6Kp3PAKKZv
         RzkhOdlAZm/ViIGOuyuRIBKJtuqDkTeiNG3UOPwme14HPlkPi8XkATuf/Jg+Vp/9lui8
         As6cgonNIYPmg7jk291hVSLs53wjow5UAgAsiCtE0R3w9ZrzBQOfV2D3ODiru6nL92AI
         9+bfz8dH04ZlrE6UNSmasbmJTfoPeWfRVD89xFcz/X9xZc5CAtzZQIX+mGVLKmCGu6uJ
         qXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697721; x=1795302521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWq1ZPhXVsQ8TnLGQfYbZB9MhFN53DcQmkdOU8DAzLM=;
        b=x5mJi6csZyaL9M7FP7jwplslc9EDGgS65D+DFJrfYKKBnRKj2ZPPqoETIp14cAg3Kw
         9L6xSdiFY4SM0eN1WmAfaT8/VhlwdntcQH6grr4WW0e7NKcyLqnaRSrZOjihOSUX7wvp
         aBBs/F6CsuLK4VD27i9vyba6k8kRC7mjuNes+FndCRyGglDjS/sNha++w9MyCwKjmnjO
         mVJiaRF5Mx+wWBJjShTnwiC8ML6eD+tUs+kHWUlfQGdLVfat9BfCoJzK484TMPdbwDpr
         bQtU3ID0oGgWmV02YzeDUzHpOf/RlNohCpGHFOC6OZft57GBftOY/OF/hVxMiCX44fNS
         M4Kg==
X-Forwarded-Encrypted: i=1; AL+hErHvsPZOJwFeFkeE0gF7QsY7WZcmJYPr/sagItsiZ0zEWwNCvbdEH/PSMEUaIVTlVdK6L7execeYY6ms@vger.kernel.org
X-Gm-Message-State: APuU4Z8bSL1K1BUsy3yDnW72WvglkbrptwvYinZDqZB9ZUEyPe1ICE+8
	H8fkdWvKuY2eJTXzufeTgMrBwGtLmL3ky6yOuHB96/wFhJSiK1O16ocA
X-Gm-Gg: AYBFou0p77F7zPds7wP7yf0MpnRjkzqQXMDgMdDZdcim/l/6whTT1G7PzxXL4iQu7xV
	5cp0pG0maJvdvBF4Z2U/Kja688HMewvqBYuESNhIyfYwyIeHKQYd7nGwHaPAksCUuQ91I8G7f3q
	oI8W0FCkdd4z9Zi1ADRlg6BJ5ByT2Rmk4N/Fk7mLx+ahleu5rUE4Kwi1HKbGpHGmrNG2DQsG5nI
	oMA5a9CqMsQIC56SkA/5hWRlkkd7OgIwzc9KHvYi2qMCFzLVhNui3LYWYVHBjFI2b+9rxnkEKXV
	4YqGSbM9FkjTaV58hxSQjUEAF0Kbc5k7DgAK6CFzSd0PKpUrANc4iibeizqF47mTNyqnu/6c0o3
	T+lruVB8r20G8w7xVyg5DoWLHqE3sXcoXkdQJ1ufE4ynusWzbymRREsBTuXxi4BsbfIMV2RDuuZ
	qhfUH2tJRM3HN1PFE2OHWhl1IO/7dL7ZIwKehY95mvROke4pO1pM3dJhermcjpq2g2zdL+IS0p5
	bsI3ojVxrYgPUz36JXB3Xc/r0Tckx9cxX/4zKsXucR/rEvJSsTmasnvvXoRy9S8mjsH0RZp123C
	BNPb/NG0vM8U8YyYJ5uAaPhfgyVW
X-Received: by 2002:a05:6000:2586:b0:48e:2f7e:bdbb with SMTP id ffacd0b85a97d-49c72c9c8b4mr15192826f8f.50.1794697720582;
        Sat, 14 Nov 2026 15:08:40 -0800 (PST)
Received: from m2.. ([37.142.149.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm14910018f8f.1.2026.11.14.15.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:08:40 -0800 (PST)
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
Subject: [PATCH v3 07/16] HID: ft260: uart: enable flow control
Date: Sun, 15 Nov 2026 01:07:51 +0200
Message-ID: <20261114230800.1344401-8-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114230800.1344401-1-michael.zaidman@gmail.com>
References: <20261114230800.1344401-1-michael.zaidman@gmail.com>
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

The FT260 is a full-speed USB device. Interrupt transfers poll at 1 ms
with a 64-byte max packet size, so the theoretical UART payload ceiling
is about 60 kB/s (~600 kbaud in 8N1). The chip advertises baud rates
above 1M and small transfers can work there, but large transfers are not
reliable above 460800 baud without flow control.

Stop forcing FT260_UART_CFG_FLOW_CTRL_NONE after termios setup. Honor
CRTSCTS (RTS/CTS) and IXON/IXOFF (XON/XOFF) when configuring the UART.

Tested at 1500000 baud both directions against an FT2232H with XON/XOFF
and with RTS/CTS (~2.9 MB transfers, no data corruption).

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 270481766e2c..75ba68e2e8fc 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1903,8 +1903,12 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 
 	if (termios->c_cflag & CRTSCTS)
 		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_RTS_CTS;
+	else if (termios->c_iflag & (IXON | IXOFF))
+		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_XON_XOFF;
 	else
-		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_OFF;
+		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
+
+	req.breaking = FT260_UART_CFG_BREAKING_NO;
 
 	ft260_dbg("configured termios: flow control: %d, baudrate: %d, ",
 		  req.flow_ctrl, baud);
@@ -1912,9 +1916,6 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 		  req.data_bit, req.parity,
 		  req.stop_bit, req.breaking);
 
-	req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
-	req.breaking = FT260_UART_CFG_BREAKING_NO;
-
 	mutex_lock(&port->lock);
 
 	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
-- 
2.43.0

