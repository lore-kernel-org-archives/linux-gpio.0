Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699687;
	b=2ueab9KRKx0OrbntL3eLMTzkk/TaTT10RS0QkGRYXQKHU75rz6NL8IJdl4aNUAaPABut
	 nb132uvsOnyXwsN1vwF9edWUR4cu7QUdX4KBlEOJQwO0oxdtrXxFKhUVriaqOeljk7oww
	 8sE5FAuB6f2u07eSWinKO2n3xfA+lFYZWm8jVUWVSTpJKDtBfrJdM+B+qF9yokUqAl2Av
	 SmLiAkI/b7T39jcNAkwAFqpY4fnDiKE2EJRdkHg61MBxw5tyF+HhIYdKA9UNwK1UytN6y
	 uEounwZXSI+auMO/Z84NFr4rzsybNO86HG5dfpywTVJVdEqvcblQdJxD89PgPhUgTUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699687;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=IXyCkn6kB6jrvCX6KIPedRjNiQnsgosv3KlT6M5FSMA=;
	b=GTvpG3jBdmSIzqqTPlarAk6aabPNIL7GMx2sgam4Du1spe+wpLXlPpf+h6QJKlvTBz1k
	 a2jz5+d++g3s/gnPS5fam5y/VcZpFyKiY15YZviEmqMSnZpab4/Ky+BJHJ2qAKNn+r/v0
	 yCOXzilV9ICsSkRrUisSCHDbkqoP7Nq3skN/4Py3fB0Om2iK/h66h5z0lmDH9JJeca29X
	 zWcBNnua5Y4VJ2vPtKk3fExf85MWtD2VoTTgS4iInbjiHd9eb+2ts739XL3QyRn48Rl7L
	 LX7VHgQryRhAQ1g8zZhKj7LOtnI8y9GfaSLEnHrhoe+rGJw/zG3oJbc24ahsEyVbJLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=HqWL+nFh;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11E5606A323
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 13:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D11E5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=HqWL+nFh
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb2;
	Thu, 26 Nov 2026 21:28:02 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] gpio: loongson: Fix potential use-after-free on unbind
Date: Thu, 26 Nov 2026 21:28:02 +0800
Message-Id: <20261126132802.4091101-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa2180aada303a2kunm399dfc3c35d94e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT08ZVk8YS0IeQx9OT0gaH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=HqWL+nFhVitIpCmR306i8kN83dT8jDiPXSb/ZJVryNgq6RrqTGyRlA0QIPa57h6e7EATAii6V5MbIEkvFfhrDYZuV1YSZ+hxrzms11qNbYPdO6H8n1o0cQHLsdtpOCFJhJ88N1XNeBvJAs7YrkW9Ym0qySTAuXINNYZQ56fcEXU=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=IXyCkn6kB6jrvCX6KIPedRjNiQnsgosv3KlT6M5FSMA=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The GPIO chip is allocated with devres but its registration is not
managed. Unbinding the platform driver frees a chip still registered
with the GPIO core.

Use managed registration to remove the chip before freeing it.

This issue was found by our static analysis tool under development.

Fixes: 70e703e7410c ("gpio: loongson: Create a dynamic platform device")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/gpio/gpio-loongson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index 042e3fb0a033..44362aa85dcd 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -110,7 +110,7 @@ static int loongson_gpio_probe(struct platform_device *pdev)
 	gc->direction_input = loongson_gpio_direction_input;
 	gc->direction_output = loongson_gpio_direction_output;
 
-	return gpiochip_add_data(gc, NULL);
+	return devm_gpiochip_add_data(dev, gc, NULL);
 }
 
 static struct platform_driver loongson_gpio_driver = {

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

