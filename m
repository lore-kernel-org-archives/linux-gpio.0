Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945919;
	b=ODDKSJ85TyS2w6XdhPxU039dXJuOfnxTtueKz9irrMkf94/1Goif63GeA3GIlStxH72m
	 xBnSAIeDDAvQirMCcnmj3RCakOZP4aOFQCkYr36rY1LPaABCeawnBmvcEak+0loq9HPE6
	 BFJKHcTmhp1fnb7Ucgecg0fWd2pD/2qpk3xNwPifwOLkMJC8sIz4KNsAzsC97jDtEMs3t
	 Z2Nk3p8J0eXXjCWAQ3oWdE22nalVoAWjKSoxQhokpGUrotYdLhIrVxtuBxFnmo33CqXuI
	 pDr3wAvYatjvznIDzXyip3OfbMJ+X/dwy5ZI+czD5EQKW4LCeq+ZwHVrGs9Y5FxB6dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UPJHLmwLZlatSt25hUeelYOc++vjVu9QgMh/X2VZQWE=;
	b=S43BhFrxVcajy80C0W7pB0km0TnD21MMu3wiWjXawBxHZnpkHtkRj933pKxa50+O5/pk
	 vUT8TihWvxncY7eNYSuTVOp38UrPmWmlbPpxQT2BJe2R0VBmPJmA0sgPgAJtJHGptc1N/
	 cAz/bEGJo0HECj5Pi25gRlqBKYqQ6iFxewQUuIxPZazpY/Ja1vJl2pFAaeI3Uq4HT65+b
	 2XhXS23f+WA7JTEgmyfIBKTqRm/lJvXZmUT9CLUbYbYhNSF/mVyE9Fz+q/mZkkWRPj51r
	 HH0jL7kBE+SDyHRsjowRxZKFrwywkFtXKgfMckxWka05pINmKXJknJIpYaTxNmFLx3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhjW25tI;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF019606BDD4
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 20:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF019606BDD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhjW25tI
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so77157f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 12:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945917; x=1795550717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPJHLmwLZlatSt25hUeelYOc++vjVu9QgMh/X2VZQWE=;
        b=MhjW25tIfRYDFt6msKWXKEZvsJV6FE5BXzi3zLiQABXwwGUAb5mjJJggmlAam4lj3b
         vhPPsArgE4/SYAa+JMmZDpvUr0om/K7XKG8DCsfpZyelmr+S485w1DRAzID/YEqZb3EY
         X7wb4bvJ2dFOfgMqvjavHoFFFYpW0wmrtm02fCdi8AOWM98wqAdRKgVgQLdTzJDL9H/O
         z/H3LFCPflALGVzOGNyE1TDhtcN0oOX/qVni+8nM3ne1xcUh3JxY1QDDMoWLAH6eHpIy
         mDCS2tIKmDeeGidOh7Nb10Y3iVTXYhq2Yg5yb1m4ZCuxEWn22XO8ELQS1Undomc/aKEh
         DOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945917; x=1795550717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPJHLmwLZlatSt25hUeelYOc++vjVu9QgMh/X2VZQWE=;
        b=rvpfg8CftZAJJxkgyb5/PZDebG8jybHT9Yd0x7aO1JLmefXSyw9Sg53LazxN4N6dcU
         ZhttKcd/PDS/wxmYZvZdInTeYg+LDpkoc4k88x4OX9aciWLRdsUS/4yT0qWAUHoXrWH+
         AhW2vqD1PbrkPC4JF7xzhHDLP0uBuyJ/GliV9fDLRBEH+YYRbs1YR5MlYsn07bzPTW43
         BULATSI/8LOSgww5yZ4vIUWjQvyyS519QaMix7JjlNelq2nBZlOpdkRLR7yKpv3y+YKN
         LF50TPeFwX7NWCF/nSxvCzqoH4M4/Pd2Wkdo+B+goDbPMOkVSvPgmvM9H0E4HNohN9PT
         V57g==
X-Forwarded-Encrypted: i=1; AL+hErGErpsYXa5VyVUE9F4oAZS7N3H/QpudQxUf+URj7fPp1pNubqwCFMfCcldxqUEe3bFfjfDO4D01gv+K@vger.kernel.org
X-Gm-Message-State: APuU4Z/DNfY9Wvh7KSLXsTSYNkjK6Fxhnxo5JKXEQND/4tuDC+05B0pN
	zKe+Fw8MrY6GiCowcRfHPZOXT/LzTHBjVzzhQHctkg0lX7ce8lCqeziM
X-Gm-Gg: AZFdTZeRLiU3E8m53IcyB1GEt6X8J7KmSuPk14QRn8dq0Q7MsB6t9PlPyeNUZIDbY7W
	cDkTIozxEi1zN5Xv7oCLRUeT0bT94u/75AstA5EqtRl7UVpUYAjB9lBTTrgZVF98pcFcgNNrCqF
	dQq31nqzdNVJRYeMYDXqUqNDZLK5ShEvvbVP1GyNbUkFSprPsKmUZZrehSDwIPibadm2ZklvX0T
	5GD3tz7j8qO5lr9o08ZNp6J0S6QKOk6XUXa/D2db1AwSIHWeYkMibo5y4fHMOWCbyaf+MkSZMVt
	+hKeGkkK8X5gPDkVN4c/iCHy9cTSThBiIAavG9gEz5AIFXdBNe20tb+R0pr/FbU/EUxQFHgtumo
	Y7BAKRUwyHesmlgOo4j+C6ReHBIOAQHjH0OvtWaHDEFZsJ2pxydhddFKtEYMrcF2YO1qVtvUrV3
	Mhj/sbhZsn1QG9YFMUTQYELyQgdDY2OqiKoKB4t8hp38b0E4ZpWzPEiEms1JOrvyGClMpI92+9f
	KEzJqmJCwg0+icrV4eHBPhEHnNT+cv8D3lpGL+LBe2RIcFmpj/6LUPQEp6kVGz7HYuepHjO3dS7
	sO5oPaZm+P+r7ahak0W/eJDYa+27
X-Received: by 2002:adf:e002:0:20b0:4a1:a2ed:bc1d with SMTP id ffacd0b85a97d-4a63b6fbe61mr885459f8f.43.1794945917177;
        Tue, 17 Nov 2026 12:05:17 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:16 -0800 (PST)
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
Subject: [PATCH v4 07/16] HID: ft260: uart: enable flow control
Date: Tue, 17 Nov 2026 22:04:13 +0200
Message-ID: <20261117200423.19561-8-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117200423.19561-1-michael.zaidman@gmail.com>
References: <20261117200423.19561-1-michael.zaidman@gmail.com>
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
index f722ef0ddf06..21789e97fd18 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1945,8 +1945,12 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 
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
@@ -1954,9 +1958,6 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 		  req.data_bit, req.parity,
 		  req.stop_bit, req.breaking);
 
-	req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
-	req.breaking = FT260_UART_CFG_BREAKING_NO;
-
 	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
 	if (ret < 0)
 		hid_err(hdev, "failed to change termios: %d\n", ret);
-- 
2.43.0

