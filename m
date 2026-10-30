Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399842;
	b=ZNY9PiWJdVAfswrub+qiSqXL1UqrqeJxp0/NbStXWLyhRDZI3sZJ0NLhCAGzaWqvtxCX
	 ++HSHrI+pulNlDjy3FTCvmK/2ZmBGIFbeWENL12kBHtC/m9XsGcbNyLnKjMJA6QRux9Pu
	 KmMVOIw6WwxkQ3ZrLjuBdUA+C/W0Up7mJFbPKrF11opzlFu2T+a+l/NM6icOZAQP3HGqM
	 fh4yA1DkrPL9cnEuYDEzUAltFPmfkuPiivzwuwRSqdnN5oYzjImZnJ4QrShgDVzkaY23y
	 Dg40RlmiEcv2/Lega1Vh/TWtlnqq+o7VO0taEpqO7JTq7YR50DcUc4CrUcQc0CqH+zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MVdIdJZip4V6Y6Le2JTKH9hHaIZalIL6VdbzzoeRaKk=;
	b=ZuqdDTGSrPn250Dfv/xP1RknuW6bioCDSI4O50ImBRWU3QJWrDJ1c0VRBRIkyFB1d/xx
	 BRSnC1p2oVFn41ChvxsXsm/N9cvpfAIH4LXqLI0Tjhi6rhHYOV2LIfwnUSoPR0udbgddu
	 eNewOr0hhYwcFKiBCEorUskf4nMmvIXFV0vMNsjLHsdqixruO90QwkgJ558DopNHPZU5Q
	 X4rTLsJQafJEr1AsaV09mWgLEGIiglookhjf6nwk5Q+/08vVLdkaVcYAJjzZ2R8xeG7MF
	 r7/tRd4SmxOKpu9wKczAtcXVM8dG2C62AlDaMO6XlAe8oQxTBtljg7g/e3Mc0vX1yqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYiSZd5e;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435E60A2617
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2435E60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYiSZd5e
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12232285e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399832; x=1794004632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVdIdJZip4V6Y6Le2JTKH9hHaIZalIL6VdbzzoeRaKk=;
        b=OYiSZd5e/v9Qof0ZiLjCYYymHax/1QU48N2uX9dn4m1M4qccuhF1G7wPnKY4H9k4q5
         PtpzB3sAcrowhyCGu5SnRwnulcJ7mN5TYRubKPzHnWxekRYqBKKcn6vcPvG58wvpXJFT
         /5Dy7btFOddSdWxm31iuemYh/f+k0YgEHMlL9VebsDp0vzJl0OgB7BPRP+6RfiNU6nBI
         yjiLDMgcpLVx3nD6nstKc/BKRdRWRjaTXUJjTgQVhyQm01+g6C9edPm9evr2s2YlQpWr
         HUk0Y7meX1O0+a7b+k7Y2aSF/JhI48htx6On+lmTbAlfeFl1JuUNy7WdfgUMCJQneyHe
         cvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399832; x=1794004632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVdIdJZip4V6Y6Le2JTKH9hHaIZalIL6VdbzzoeRaKk=;
        b=iG9KXDmzoI9PYz+e/D3KgA5g95YyTSOOsIu3u5Ba3/dS3BKKtvos03IMAk0+PonJ6F
         Kh8c73DIKhwff9vsTtN++tH4mjwbDBFbtnEDAQSUBoW3/TI2iXUcbJBd1y0+a9yTV3Zt
         WYkUd+u4QUXc9X7y11NK86c8ueZ6ndQ2nJqEVd4H3iut7LwjUBPmNDaRZPh8gXr2KLIR
         yL/81tcmEUqEsejkLraYOA5+nq65l66uSoXezdDfaZ+svUrdSFpPVyfnKN+/RPJlN0Iq
         JsaQu/g0Wk1+xxsRd7z4+ukTsQpU/Xp9U0GN7jdzXSiMELQj0dtkXouOAkbGrj4Jwzpj
         du1g==
X-Forwarded-Encrypted: i=1; AKwUvBz0a7+8Kah/S6GFr//jFK9GHvAIWQLydJwjoSwm+yiAMYHhsfWxt0p1Oe8F28wlG1xX7eaOWyb6ZO9w@vger.kernel.org
X-Gm-Message-State: AFq9FYLiISfQEmcStk24GHa8c6y5lYeZpG+RRUEOhB/Gd5jolwBHx1eR
	3UjXW7Bdu6P3nl/XrrAAhrFGY5fVDIJ6FCs7ZNEpDmmHgl/DWwrNp8DX
X-Gm-Gg: AYBFou1hO6sOxHU4k4B35xfuXdJpFnc2hRDAVYtyStkdy+fm6S75ynmUD+RiTv3DjiZ
	YcFxrndhtO4B++pPNMuXpF9ldnlOKpm7Fv6WF1rvDycflOvMR7SrfH17ssQUeIL1VVENjhtEbSz
	LXsEyaUtJouRZncUM8EyNWeG5FOpTwtoJLxEszKUzol4ZZs9biim2KRtCm4/h4Y/JqQdvWck/PI
	1A9/c3d2MKp3BzELDoIi63cZPK41BGDO+5ENkV/EFeC8NZXCV0PQQVRNVisq1/kVmOUTimJVepe
	5Y4D9vxgOEWjzLFXG/WvrwfM9rRyNa9FsPwYtypfB9Wm+DlMnjk/D7bGZklde5W2AvolqDmmIXZ
	Eqlas8mcRbC3UfFrz+Qecp/YlzH8Ua/WFAQ7EqRK6RPCebOvZpfMt9SkYmBCTul139CTRAJUdsm
	d9axaKglDKwyw8ifZaHrNlOq4sVUKmXY7pTECRBPActLT8atDRnIE6+D/iHSEWWjeMbm6nk5Gv+
	PkOEZyOTGlAUx4egxEArfxZV8C+MhDiHtSNvXkLmKitQxAPrPYK0RkwAbLU012vefwX/sfbfs62
	BVsa5hWJ0mh99cE9Qvf2HtG2Gyzn
X-Received: by 2002:a05:600c:3554:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4ac18c7461emr88275265e9.35.1793399832545;
        Fri, 30 Oct 2026 15:37:12 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:12 -0700 (PDT)
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
Subject: [PATCH v2 07/15] HID: ft260: uart: enable flow control
Date: Sat, 31 Oct 2026 00:36:29 +0200
Message-ID: <20261030223637.86907-8-michael.zaidman@gmail.com>
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
index 6f8d72938702..4b0b55c98f90 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1897,8 +1897,12 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 
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
@@ -1906,9 +1910,6 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 		  req.data_bit, req.parity,
 		  req.stop_bit, req.breaking);
 
-	req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
-	req.breaking = FT260_UART_CFG_BREAKING_NO;
-
 	mutex_lock(&port->lock);
 
 	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
-- 
2.43.0

