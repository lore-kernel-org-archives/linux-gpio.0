Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B9A3AC0D3
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526560; cv=none; b=sBJBlWZ7Oww64WsOxf5M3ocixZgxjNih221Ksu4J1VPyft6exEYdjr5uhSsdibcywuGbolbum146QEWsNg4t4SzTQWMEh1i0KVsZVmNTgjJa8cnGsKMjngBwZTH0czL9Ob/QCQorPD3dj5YoPETINJsr8KRYudhaU7f79YHIB5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526560; c=relaxed/simple;
	bh=06aTGYdDhkRl6c2UiNUp2s5FUz2ScU73smKKx2loXSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=teIMCVKnJsTEDOrnSJREzCLpI/BTxT9v3d8lPsiKdCVaicr7nwLLeGa5dne0cBWwvurf/ZiJ2/UA6mNVbbiqVzYDCA3nM6SfaQKILbmA+S6Ts0Di7U4di65ciuLh4XAQkMir3LaVvuXfWogQWRl7TFlOiZTn3EOxoQVapUmiZnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Q46NY+PO; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Q46NY+PO"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c5382806fso54013441cf.2
        for <linux-gpio@vger.kernel.org>; Sun, 19 Jul 2026 22:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1784526547; x=1785131347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kif501Ot1YS2Lrv6j6eKox/KCdIXCI2kxtcLKxuRjK0=;
        b=Q46NY+POpM+FGcU9hqqOFlM9P9OZHe8e9UWcD13XKSVB+f6AjETfobLyrJe92DKDW7
         AM2tGwu941UQygbKUSJGChvE+0b1OKD06yooeuy/PpK1gWozOUxf/HVstUrbiii0TskN
         0LiuWRwxpUTe4zDewQZG1Z1kQk+q3Jx1mue3uJAV25azUoWGiDxB9XX90oVekD5Sv2iE
         yc10+naLUDuQCmP5XHSolCV/J8A9LPzdsvPA/HG4tncfe2gsSrooVS86rGboBXRE0Xz1
         qcy/Auxzfs2EDy61xhfiAL6iUYbw/Ewn7YmEQRv0u1zrqZot2g4soZ6WW7Fs+pOrrtjM
         QePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784526547; x=1785131347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kif501Ot1YS2Lrv6j6eKox/KCdIXCI2kxtcLKxuRjK0=;
        b=hh/lOhmff/EHP8tp6wo5vmYOM6yQXjbrZ8v/vbVXuefaIv+Sd6uz4SL5+hEJUCHuxZ
         FFhLnjPbwOSHCzi5G9pb9nPSAaLiP7T43HtsWIpQDL2U8WgH7331cCUrCxd7Pqw7bML4
         bT9zmpD45nBrdmY/wT87PoVQbOtbAzV4pG6QuIQmIpAX40kgiZ8IDxtj4rrnAGNoQ9db
         WuL+pxurwEMf7WwXjF92AxcfYx9IqFxNuiS925u0SjPR/rG0iNKpU3p4phUn8F4THq22
         9s5mbroNepC7zR2op9/aGHg/5peuuW2h6j4iN3ghTowSmg/ROIik27bbCDUiFN/UVL/M
         W01Q==
X-Forwarded-Encrypted: i=1; AHgh+RqSqviH5gueASQgsvnKbdEDPIpIz4gjUI8+pNHdbrb/N+7ZKntw6oWQlaQBs4DVAgmE/0JTQtRFtT9H@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDJBg81eQgac/Y84YdYBLVmOayHTmGffUFuldBHEpTI84e/Gd
	LpRGkt8NsIJFW7fSh7i8vHWuXJthV5h+EGFicsme7GfNscsgG+J1bjL2Qp6EFVHBZNA=
X-Gm-Gg: AfdE7cnseMKhGXaZG19chl8IdMjipiYaefwk8Wul6nHFRV9EESKt7KO7woHKCvLKOuT
	gaUTlqYzK560LDHPFFUZllTS8/dXKjZxSfcCNG8EvlktIh4mr0KlOwMYDTd9zMJPP3nduujnJ6s
	eB8qZG6JH8NNRR0bGrpWrHmQ+kqgCFYOFSBUazEY+A94uEOlf+dgjguM79W1+S0mee+X82i1zED
	8ztLgUJyudYOtD/zHU+4OkMveNQ3wJ932HpQNl25JSWraqJakH6zTMaQcrH5k0Uufi1FXvDY3uP
	BBY60qvXwQpXGuYQbo4Pi9xdHnOqeedKX0gATjF8PRzXJqe+teyoo9m7tKzgF57xQHl/SYaakOb
	Jtg39SxfRGU2m+2RbQZatcTeULfUUr08NFEa1Hyg3bRFYiblAU1lU9MYijfroxt2EEusG6ozbX5
	MUoWJvjBw=
X-Received: by 2002:ac8:5aca:0:b0:51b:fd82:22dd with SMTP id d75a77b69052e-5213d2b6a4emr110458171cf.15.1784526547250;
        Sun, 19 Jul 2026 22:49:07 -0700 (PDT)
Received: from localhost ([146.190.222.192])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-5214f0161e4sm65601511cf.14.2026.07.19.22.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 22:49:07 -0700 (PDT)
From: David Lee <david.lee@trailofbits.com>
To: Lixu Zhang <lixu.zhang@intel.com>
Cc: David Lee <david.lee@trailofbits.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dominik 'Disconnect3d' Czarnota <dominik.czarnota@trailofbits.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: ljca: validate event payload length
Date: Mon, 20 Jul 2026 05:49:05 +0000
Message-ID: <20260720054906.69588-1-david.lee@trailofbits.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ljca_gpio_event_cb() ignores the event length and trusts packet->num as
the number of two-byte GPIO records. A device can provide a complete USB
message whose nested count extends beyond the payload, making the callback
read beyond the receive allocation.

Require the payload to contain both the count byte and every record it
declares before iterating over the flexible array.

Fixes: c5a4b6fd31e8 ("gpio: Add support for Intel LJCA USB GPIO driver")
Assisted-by: Codex:gpt-5.5
Signed-off-by: David Lee <david.lee@trailofbits.com>
---
 drivers/gpio/gpio-ljca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..cb2b2623ccb1 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -290,6 +290,9 @@ static void ljca_gpio_event_cb(void *context, u8 cmd, const void *evt_data,
 
 	if (cmd != LJCA_GPIO_INT_EVENT)
 		return;
+	if (len < sizeof(*packet) ||
+	    struct_size(packet, item, packet->num) > len)
+		return;
 
 	for (i = 0; i < packet->num; i++) {
 		generic_handle_domain_irq(ljca_gpio->gc.irq.domain,
-- 
2.43.0

