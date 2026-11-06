Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932164;
	b=epVubELTZKCrU6kx8PBHReLH7I43BUBdHa4mP0ldreuyTRDty/ndUhU0xYnv3Y5AQPuh
	 tHF+PI4mxuHviLmOub6QJCReMZjKsZOEoUFsYa/+66yAuvsENvxx1fy0m4pfdbsuv3KG9
	 qhyWd3Yae/+f+8m9CTXF5t0moBy3mFwCNSlsOPuRgKjwlqfLR3Wd34pCCSZg0OQpcHw2e
	 Af/I6+0UK7YeaWgD1szulEAZmBAosuXPUSq7D/mjVDSSiir8jGxXYqeo9OzZzmMUuN2f7
	 F5JXvZoyGZoGlBmP4wwMIlM1c533nzT+U2YrtHcsUT4e0GFWccZGzxEp8PjEGlbmUiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=;
	b=kk6XLLOSeYeODkzZrGqlbYdbY1FSzK3A/bRyO0HBnNRN+cJ/NkQ4KZ6a5rY4oxMlfllK
	 0G6whzEB3P8LcVD/TU47D9pmIdO5DyHpQvdW+VPF0v/YnUaN2X5Zt/1wNSiDDNwc/tit+
	 RYeQCoNdMkUlwTd1CN6gChIYrUj0cQTjLmcJcfXB1ExuaqQ1epDVDq1skyMCx0Espl1of
	 9hYH4Am2wNFAMHvx0oLAneadJGQ5NEFfTsiuVQs6Hu1GMNxSdZwyJtNKeTkffytoeAKPx
	 eJWxbKdfK2QN17PLaMnjYO9QIpg5xTlKjg98sKXr9RKV3ybg/T2yeruLB30XRzl42Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sGQr/DJG";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA37606A32E
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 02:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA37606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGQr/DJG
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so284837eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 18:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932162; x=1794536962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=;
        b=sGQr/DJGy679csZBWS0FcJ6btQINnMl9KOqW2B6Tyo9y4l2cY3zwF7G+akccVEVlTL
         ochRuDH36T5adH2abNg7XbV/SMfID27wRusVR4d8nz1zyBuDELJE5u23K6oLoEgphAtQ
         T0G91OjAyUAz9nBqDsKiTe9fDyQHQjmBbFiB4xOIXQ3GW238bz/mvwQVVzjkNeb6TVHS
         MVjsO2gTgR0Nx76vuSNNomf1NTGM1fIoJJnD9a/EGRC01rHGfqrAkmCFmCCVuiAr+ehx
         MX5RjkNkp0T4EahM9x0f4ceJQuEGu/3Ei+MaePDBLmCsMZ9mVFsM/NalAiasSa/mj3aF
         Schg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932162; x=1794536962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=;
        b=tUdO+SwHtOUMF0h0BcdJ0zSdBJj/sMapqsAWZQZu7tWvalFTOiXNXUc+j8qpptdvqU
         Sfl3uGcDMVBisaBuT4Ywr6zrC+H8CsTrH0bbmKrBRJVruKVCeZMikEzIICnMpN8Ng+Xi
         kl6hlfXK2/5GPAPDonYRAHddg0AX8IFOOnE9EaLTubvHARbZwtgPreXPebv36BikkoCc
         CTGnKRioZ6nvX1p2FGdwHqdBxj7KOCGwwtI8tqF7l2Zwv17JIapaw7F4q5+YlzXUZhJM
         p8feWnbMXTov8GcNH5Pgm3GUrYjDR1O2djMvzcOOwCVcDAtrzWvuL637b0KjaPnesMdc
         a4KQ==
X-Forwarded-Encrypted: i=1; AKwUvByGbVF34owOq0IssCN5ZhhB7cOH59YkQdRT5C5lDbGRZNLlysrngOsO7VmUcEADzFvqoEg5USugLiGL@vger.kernel.org
X-Gm-Message-State: APuU4Z82QmNJ2H3N348upw+MopyYkt9gdi17baO0iISmXn4mvYPVFoUy
	ca//8CNLbaPI1nJYAT5tTDV/7IoXSJyOm802ik7HVfWJccde/C2WN70q
X-Gm-Gg: AYBFou0qHBiovHxDwt1QQ/Oi5q5pupNBkbzSDbHU1Y3QcsxPOAZGatrpg3HfZkuKLpr
	GOKneq01JeL/j8Jf6c9JVcUT5znjGYyglaRc8x4O+W8df03EI12Ia+fD09wCM2O9KMiEjTfimGd
	FbJNK6ux7XlSQf+B+xrJcYBg5N9/piwknFxTu9rPBKJJBclkE5SldwnIe7SHL7JT75PUO5EaLJH
	NSg8HnqlyCkuGAVKmKpcGzfEiWTqQszXBbqyz33s/CCv8GpBI+oY/vmjf3+UqKJPKNmmNhWzK4Q
	aMMxTbmVV6+Ap+4zDwlqf0U4K0Z8GrKF8ZFEyeOgt0uJn3K8fux1CrSd5YguAxFjqig4bqDvXDR
	jSq9PShwPH40ChZt93Yn+WhSEzeVDgdg+QN+/fPpJgK5r6+umOOYGl1anwHoNw4+FjT4fCfJYj1
	N6uEz20AZ5akHPgG9UOOnMBs0PIZk2/eEMxB+ZufyZfU23aBVmcyNrqeED+PJHYLnOJUKj2IMHv
	RG0WT87VstIQJJeLI7cWckbXJ2bmfnKx4Qtc5I8gKTmISKIQWhIu5Om80AMibGWd+x2A6V7mLcX
	l2VOVQDDtVdBpbGhDnzTjhvq4IwRoPPilOt81eSWBlVWbDM=
X-Received: by 2002:a05:7301:fc02:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-36f761249e4mr1506830eec.34.1793932162278;
        Thu, 05 Nov 2026 18:29:22 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1700358eec.6.2026.11.05.18.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:29:22 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 1/2] pinctrl: aspeed: Use managed pinctrl registration
Date: Fri,  6 Nov 2026 07:59:06 +0530
Message-ID: <20261106022907.10735-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
 <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
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

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it when the device is
unbound. Registration can therefore outlive device-managed callback
data, leaving a registered controller with pointers to freed memory.
The G6 handover change in this series embeds that data in a
device-managed allocation.

Use devm_pinctrl_register() so controller teardown runs before earlier
devres allocations are released. This also cleans up the registration
if later probe processing fails.

With this change and the G6 handover patch, one unbind/rebind cycle
passed under generic KASAN in AST2600 QEMU and on B650D4U hardware.
Controller debugfs entries disappeared on unbind and returned on
rebind; a subsequent pins read succeeded without observed KASAN
reports. The unfixed control case has not been runtime-tested.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11a..d19b4d23c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,8 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	/* Unregister before earlier devres allocations such as pdata are freed. */
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-- 
2.47.3

