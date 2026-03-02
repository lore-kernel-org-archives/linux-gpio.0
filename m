Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BD73815FC;
	Mon,  2 Mar 2026 20:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772482947; cv=none; b=sd7ti9MMCrp+3nmLtvcJDQfiZ9hbtyVo+RHnnQMS1MEzt1+xVW584tGh88TVUQ4OshLdB/+yuDIXOKCRLbKodWbT7aBn7RuLHmVnNILU2n3oxdqrxCb1rJFtcLpBVIbfuxG3Po5F37OQ1ydRbZONgvlKgwuDuGpEI4Qzo0eh6fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772482947; c=relaxed/simple;
	bh=yM0KDYBtrA+Qi5e0AETY1oXk94zPyWiYd/KNNb2akSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JjGhjVF82wah+s5EqobRQU1Tm3QRwZktTB0zvTSrYiLwBzHif93GdB/1Aenr7j9aN3ymqwvjzZQFwvkfsI6VZkYOZf6gbJdQW9RV8YSqGZChb4zHT4n4q6rgDCFX/vL+sMmOqvbzg5orDj9mu4AlR5v+KzxmQ2yXjqej4IW/jM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=tika.stderr.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=vAjiD/TA; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tika.stderr.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="vAjiD/TA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7ATHPEB3e1UH9/qmmsRpONn2iBxLnjxasZ5QOYn7RXM=; b=vAjiD/TATxVmNyrnt5oOfPQZn5
	3sAI3clXF1h16unD/2iY/Y/JO872yNVKS7MzWq3cQ+ga0S00q05Zh2L+t367n76CrQ350pdxIKpcO
	GSD90s8DlRiIke120v/ybBtg0c/1GlPRA988IjUUueVvZH+wc17cJRQqbL+cnDsH81Ao=;
X-Preliminary-Spam-Score: -4.2 (----)
Received: from [45.142.19.84] (helo=zozo)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@tika.stderr.nl>)
	id 1vx9mU-00HGhW-26;
	Mon, 02 Mar 2026 21:22:21 +0100
Received: (nullmailer pid 198761 invoked by uid 1000);
	Mon, 02 Mar 2026 20:22:18 -0000
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: matthijs@stdin.nl, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH RESEND 2/2] gpio: rockchip: Call pinctrl for gpio config
Date: Mon,  2 Mar 2026 21:17:17 +0100
Message-ID: <20260302202121.197288-6-matthijs@stdin.nl>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260302202121.197288-1-matthijs@stdin.nl>
References: <20260302202121.197288-1-matthijs@stdin.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pinctrl is responsible for bias settings and possibly other pin config,
so call gpiochip_generic_config to apply such config values. This might
also include settings that pinctrl does not support, but then it can
return ENOTSUPP as appropriate.

Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
---
 drivers/gpio/gpio-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 0fff4a699f12d..ac1b939283eb7 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -296,7 +296,7 @@ static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		 */
 		return -ENOTSUPP;
 	default:
-		return -ENOTSUPP;
+		return gpiochip_generic_config(gc, offset, config);
 	}
 }
 
-- 
2.48.1

