Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9E43A6EF1;
	Sat,  4 Jul 2026 12:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783167696; cv=none; b=tp5AKc96oVU6OULa/s/NcUIkOJQ+O0QWyoV5bLlEi3TIbDPSU1pYHzBTvJjOnmZoTKjWtWimU3ihFHTSBusG5ZE5pBPzgUk7Ejgr8HMZx44bkYjpwrih1kObhesEJXQ91doSzupgktC9ZkoUoJUk2xRchYVOsKQ8YUKGPerdBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783167696; c=relaxed/simple;
	bh=U5ninCy/7FJ6ArX3lj2NsuLqGhdHRPjv72I2HuyQrKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cC2XFCsBquDkioU8CBtt/wpaBCdvPyh5bvdDLHXTZ6rjV/YjAUc4ThnM9v5pLDm8fMutcPgiWVmju7HGkP43YUiqzmJrl8KIaR742xB16s2Iqc7Z6gr8y9DfPOLLQI1Cl56z2J2pBN8NbMPIyd0XPX0IObm4MM/jpculKcgfJzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABXL5bF+khqiQ_WFg--.11271S2;
	Sat, 04 Jul 2026 20:21:25 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: vf610: add missing MODULE_DEVICE_TABLE()
Date: Sat,  4 Jul 2026 20:21:23 +0800
Message-ID: <20260704122123.73004-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXL5bF+khqiQ_WFg--.11271S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr45uw1rurW7Aw4DuryrtFb_yoWDurg_Cr
	ykZrsrXr1ruryv9F1ak39IvryIyw1Dur95t3WkKr1aqw17Xw13CrZrWwnYq348Wr1UGF98
	Zw1DWr18CF429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4U
	JwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfUODGOUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The driver has an OF match table wired to .of_match_table, but does
not export the table with MODULE_DEVICE_TABLE().

Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
information is generated for OF based module autoloading.

This is a source-level fix.  It does not claim dynamic hardware
reproduction; the evidence is the driver-owned match table, its use by
the platform driver, and the missing module alias publication.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/gpio/gpio-vf610.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index aa8586d8a787..adfa2c2d5873 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -83,6 +83,7 @@ static const struct of_device_id vf610_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx8ulp-gpio",	.data = &imx8ulp_data, },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, vf610_gpio_dt_ids);
 
 static inline void vf610_gpio_writel(u32 val, void __iomem *reg)
 {

