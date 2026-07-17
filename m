Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427C437AA64
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300315; cv=none; b=jV2zExxDZpNx77vtnpC6YoUHBDsBED7l05g8K/vQyZognZDMVDsZkwCC4N5H/2l35yYm74XF0kwQtXBpazLxeVftra9qOdpFkFIVNqQw6EKuAyhObQ9fzWDbTCDh9KtOCTsvXWv/tH8vA9AB2wbEodEHlFmout21HgOixQ8GB8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300315; c=relaxed/simple;
	bh=06aTGYdDhkRl6c2UiNUp2s5FUz2ScU73smKKx2loXSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GN9L8hWapnq1CvNnHOlq0jVRN1Iw8vFWu080cifIh3ILPu156V/nEq/pu57MSdxRC4lQMjO8NkyEDt25EzbA9aS6ucB4tls8vil/iVRG1Zmv7632UygWy+dNb1WOQKXi3bVriMJithj+USrFnEqwu4SDqizSOprUCzT+gXhYF5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=AsoJ1daj; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="AsoJ1daj"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2b2c9eccso60024501cf.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1784300309; x=1784905109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kif501Ot1YS2Lrv6j6eKox/KCdIXCI2kxtcLKxuRjK0=;
        b=AsoJ1dajdLMZkeYqA2vopESMMArgfpHqJ9g6zWe3mC+lNDNt74TGEpTAPvUtAvBlHH
         E63UJjskenW/TDVWLXmq3Exh89ax7kI2gWDKgIW2KZL2+iyBhjkYEDrm59KQJQMAug0v
         nk3Oduqix3lV/KDWUaa61DPpNjsZ3S7MWNUrEvcSzQpYSX85OKlPomY2UrM2ilxylNMY
         bdgt4ftdAhIs8k3pVEUSrUbk1HFv262RiMt+aQyBi+eExaIkNsVS9ds24vWcfnws43T+
         q3VT3vjdpTk2K8C6OXf4m8FWCH6QM7plaJ3CCQZsw6M36wpelFXjWaa5MFqbY08WCeJM
         PGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300309; x=1784905109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kif501Ot1YS2Lrv6j6eKox/KCdIXCI2kxtcLKxuRjK0=;
        b=F9B845w1MUyY/FHrkONhTzjgD8hTd/v8sDnclJQ2on6q1r6Fmg9+63zuBVIZjuF4WM
         wIaHzQa8+OLM3keOFXxUGBifAppY62qtBd3o+ya4bqULUrRY5jOjjSX3EkHp6KFKMb15
         E7y3sbIjN4GaHlrxbkUuinGhf+5dQO0l9EI6v2WTIMsMkH5wn+zOxLn7O791971LpMmo
         v5pjDwMi9Ojy7jVkE5u3H9yZuC6BbOrJWOsO8yPjUqUCguHup+w3IBvnZtOmybIqn14X
         NbHydlOnN8KGUTwYd2sR3U0M/SbLez2Mom3rQcuP+oJtNwsfderAvpSVGUdMyKa44cx2
         T4Yw==
X-Forwarded-Encrypted: i=1; AHgh+RrE2BdfOOtLEhdVqKrlZ/WvcsGllFiU+DLoOI3m1jnzCEr3PcDoJM7ZVBzXD1juwwVI9Cj2jtDht0x6@vger.kernel.org
X-Gm-Message-State: AOJu0YylWaXJzlTytPMqLhrAsCk1eaERuFzDdfrF3ym4CyFwmEDKgO93
	/u2wJKMZ62yKOyNkTosGLqcdYHln8Zo6OOukHYtZPpTwGNns+mmDki6MonRbDFwdFVk=
X-Gm-Gg: AfdE7cmmgFcVRv0nWD+76ugkj+edOu7c2KLifBJXjVU3edjfE/B0B2ajv/+XCO5ydki
	3sy01Xb1JCixScnq9D49C0sujse1cyQdzyVtdXJfiOLpwiHQumkTAgsV1xfkDA2iMKZRMK0Sb0h
	6AHdBB41dMmvT8P9i7WyuIYd4np/8GynvRSWXYuaoEgHG7X6RHuDPaE3g9KRnEfBuFYuRHHz+lI
	HDI8nCGD7x+JGaCHuhhRn76YN/NXgGDAIpoeP0bb3OTIjxlC/I1KhAXO9iXCrMR7wQpzWKlEUlg
	nB8OaH7eFU2QqVjCqDyWo0ssAmGNkP5R5+wT9vrJHYINOFdw7FNeOulChi/PAAuBA9hU6KUkVZe
	aKsrdJ7dWPNMHtLg4TQiiYNr5NpBW4i9xSRfxE7+ZlzjAElgbpZvKZm9+LytlugXFQb0VpKbvLX
	3kZdCPfdc=
X-Received: by 2002:ac8:5845:0:b0:51c:1529:2c0 with SMTP id d75a77b69052e-5213e28fc9fmr27128221cf.43.1784300309079;
        Fri, 17 Jul 2026 07:58:29 -0700 (PDT)
Received: from localhost ([146.190.222.192])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-5214c5cc8d5sm13995541cf.6.2026.07.17.07.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 07:58:28 -0700 (PDT)
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
Date: Fri, 17 Jul 2026 14:58:26 +0000
Message-ID: <20260717145827.43889-1-david.lee@trailofbits.com>
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

