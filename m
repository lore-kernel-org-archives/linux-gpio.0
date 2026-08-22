Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DAA390C8E
	for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 21:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787434847; cv=none; b=NS4ujjVExgousdfQKY79fChcQNa+Jne2tCqpC2qS+ny4MPd0UDhS0HwWAKV7GmKtH8IgW8fTXxj8O/Ri7mjce96hUeMSa+F0Yf07aSqQyUyQpnkouHf6PdMnwtX/eGWPB/JC9kCj0pxp9LuFwsdaWYpJbdZFp25gyTbpFaWB/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787434847; c=relaxed/simple;
	bh=KJT81DzlFzree0N2sQdZCS66jmiyMjzLoVvJJAuquTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaCm+XKJOMVQT3scVNqBdXYhuUpLG5iPa3kMlWE7Rm4d5hmna+fzKr7m+b8zgnZvqqdawS+m8HQfW8e4iEadOaSmuxrjjNTm+NfPEG7HM3fOaV/SX/dP/7hWkXHCTpAmO/ePGHpb+tFioB2LE/NKw2cDcOoykpB3s891SFrJQrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2zZUjGz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2zZUjGz"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2055f5a993so254956166b.2
        for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 14:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787434840; x=1788039640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xIFPtL0bXPCQ9Wv1lusuTgPka354Csl8JdgcZxBeVs=;
        b=s2zZUjGzASqYCl7eYhoarDStryZT2nxU2QAGicis0Ajt5adlzBMz/6+19AHu3Qz+ef
         9JMCA+3oO0tN87vRjKjIJjZcUbxeojSXIezk3MaVaEdUeMS9v5SyvYPmXgD2gCyqZK8C
         9IiV/Zwhglz+8RVa67dNhO3DrUFK4CE1IN3et0oJPAg6LebGRih/ebxeifv4Wc/UElDF
         lOp6fsv8sfAbaSjF7awSlENOLCnJre0bB6JI92VDIZ+gs0G2MeT3eEA4vnZJlAsXcVOW
         i+pV37dgMXriNAdfbYiR68xdEWjaMupEFdA8OBuICFv3rpvfkO4NQBMMtzoG7V8FXLB2
         j/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787434840; x=1788039640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xIFPtL0bXPCQ9Wv1lusuTgPka354Csl8JdgcZxBeVs=;
        b=q10pFJPISipigtqOd4FIzZcc5Nj5MpbJ7VouiDMPvgFqwNiBus+fvW6WGrBxYSSLZq
         zi8p7pok6EM+3iuJ0T4bJQAtjvKtzVKALyfzufMvf4/kj/JGXfEA/AZXWPEfD/In5HYV
         Q53kFLFOzZ6Jwvbj9ev6b2vFH8ckc9pTjKEb+5IIOt42S39+H2gIWAl/Lu1Qd9qzsW2O
         GBaDvop0RAv/QUSHSTh3Q+Sx6g56Jd4bJGsC1P3Ur1dwMOMPk/eZeHUEojSmtcWap+qS
         PXA/600/3ED3vo+CiHLrHf1BGe20R6yCF3NiR9ej7bgJitMb4E5pPO0G6wVUmHA67BvH
         KB5w==
X-Forwarded-Encrypted: i=1; AHgh+Rqz+Km7euHDOOVkoCFFmmkpUwRzvghggo/PM6Lh6UrA5mNTddmYThTLy7sc/B+mJv7nIeB+H3ifHARw@vger.kernel.org
X-Gm-Message-State: AFuF++mucBNU13H3Ux6md91WhljsfC67BdDj+e1FtKkakoXWQyATHLH1
	i5D3EhdYwqfcWDNQuObXpInJmV6aUqg2XO5KmC3QiYjRxm6sCuPkUgvx
X-Gm-Gg: AR+sD10lfrONxiFWN+0ucosey7VIRjpr26KApZgJQQBBbRu2YRU7Wn5aHwW4ybeJ7gD
	WvrEDlvalOnVQ0bqRCR5RjBt1U8d0YbL+2k2BqqQJk8CDl5OOEFDhvr6bHZa2e3w2JyrZRaUMTF
	RTY7qKu1QULqGta60a8gvfN14QBX7bR2121AKmhzjQ0ZnRbfl9q+YzsQibC1flPYJp6IrLc+OiN
	eFL+z8/iRx0BFuU1M8IP3wnhajhipKuGC2PvHsVFJf2GHc7GG/iUIBEDIVVrSD6LSe0ETJZpaSO
	6rdlISTHb1b0YHdDfpBrsaRVu6EWf3E21dK1FiEFg4vCb6/N3vq922WaCdeM9w4T0G3P/OAyzpO
	H97bSQZclWmFXciQng16cos0eaXCHnf4AWSAw5PSDwJhZeDDYNj9I8XoFbAwvojGihzlmqbxL9Q
	YgrqvaBpyalzo3TJ/wbVBCn7NvObuw4JRub48bXVvmjm2jx7c7/gc0IbQxydU=
X-Received: by 2002:a17:907:3cc2:b0:c21:180c:d82d with SMTP id a640c23a62f3a-c246a725749mr1773091566b.20.1787434840266;
        Sat, 22 Aug 2026 14:40:40 -0700 (PDT)
Received: from m2.. ([37.142.151.124])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c24966f99basm466778466b.37.2026.08.22.14.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 14:40:39 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	Christina Quast <contact@christina-quast.de>,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH 07/13] HID: ft260: uart: enable flow control
Date: Sun, 23 Aug 2026 00:39:35 +0300
Message-ID: <20260822213941.98882-8-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822213941.98882-1-michael.zaidman@gmail.com>
References: <20260822213941.98882-1-michael.zaidman@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
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
index 1ed3701eaaf7..1da42b8756d8 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1868,8 +1868,12 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 
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
@@ -1877,9 +1881,6 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 		  req.data_bit, req.parity,
 		  req.stop_bit, req.breaking);
 
-	req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
-	req.breaking = FT260_UART_CFG_BREAKING_NO;
-
 	mutex_lock(&port->lock);
 
 	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
-- 
2.43.0

