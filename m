Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852AB476682
	for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130256; cv=none; b=SCIk/Ps4Y9AjbJj4XIOvpGFIrZ6+pr5BGVACv7lDBw6Hu5r3/7sRdokSwQBlnOmf4AX/Wi7mP604bR3J55ryWCih6brlzumBTL/tQOmlf+ecU9ENOgWIHrRV31K8R8VOfXxVaH8/g/Bguk2u3gfmbEZQJyMR3dq6ksM8PKCWOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130256; c=relaxed/simple;
	bh=GuuVBghfGCVvQ/+kzbMvCYEvoy51uEMX/UGIBGJD40M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAjdoeu7ZcKIssrFBYSrGYLVcyAA2uKlE+qkUOq/oZ96/vwEyCtCvmuCIwFgNz8qTJ5rwdxL2DLqIYVXHXk8mbpsPt/9udZRP+bEkVtrqiYikjWCbn7tRTWHi0T+9RwhFNx8O9mPdl3/SS+ns2hNSjXWo9jGM/3Ooqd5at3kuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKph/XCD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKph/XCD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8924865e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2026 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789130253; x=1789735053; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IARta1QCIhWwqo93R0Jyn6WRkcbpvjXZcepUuFCdftM=;
        b=ZKph/XCDSwAi1hjdL0j7hGhByjymBLeu1ftqhTKNsXpPSzSxFFmJ6aNq/Uz/iKjSZd
         0TqcI0d3BBZCsZNE7+7evvK+dBqfK1YCHoyp2JMVmdi+FYBP6vTMLr1TlQMrx9fou1jZ
         ZG+LF5dXXHG7w2FGx0CmoYO6cbkjFb2NH6doESzg981ZCHVKPN+UY5u8ovEiG6oMxtNn
         6WqrjxOoXy2mxpI7qMdwHe6Fmbkix9RdQMQ2XBKjDGi/Ti79t829tP+DMYnsvCfNQdm2
         4C10OzSlfaiPrGug0Qjsy5C8991klow4dyn4RU+yoyNbac5ViH95c9V16mW+Nie7slGv
         QJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130253; x=1789735053;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IARta1QCIhWwqo93R0Jyn6WRkcbpvjXZcepUuFCdftM=;
        b=neJ8eLHTPOsC30s6kCbnsiOKMRYAZjwUKQahywjeuQJ+6KDXLs3OKE55QpmuAc1XHH
         q5AIMHhZs8QLgAggdQzjvl+8+L00vlDZGnEtdU2a07WRKfDGoowbgujGu7kanq6VyHoO
         bL+srkw40+vP+wahTfHXXecswFwMk7Xp3bsksx6IywITWvPGku+G9SzFWKg/uBqaiZpF
         dljEQ8GtxSkkhIMnBazJnqYQvbL7Uh6S2T//C6tiYJSqDrUqH4IN42Ld6WlfRXJa6dV1
         l0y6XfHobl64VhVScTIeVjMn2vbtoG9n4mkPGxx4Ks12UzQkpDcCd/O+r3SNvrNAE/95
         /s9w==
X-Forwarded-Encrypted: i=1; AKwUvBxY0vNuzxvyap+lcFCC2lBB65gWHzujEHR/w8jGlHJ8uOIsjJmTx31Jpac3N3UiynwxbmZ2Pi5BfQI3@vger.kernel.org
X-Gm-Message-State: AFuF++l6zqaGJmv86jgDYN+ndi6g63o7FHkOfKtuMkjhfGJXjZEuEuDA
	ICenK8I02+GpYFqZ+5QC1FVNMZ9hQyn9mbSMLox68nm+dBqWw0Uj/WC9
X-Gm-Gg: AYBFou3KgfGFb1+mO/xWTnId7/+BfPOD/BOVg43nXz4oc/qwvNmYjFoWd3uHdNroXPJ
	BWm6bLLTCHm6vLBNOKu2haplegLnfzgzmDWkYVjgOyl0B1ySfFUooFxO76u8hGYfe+6GvGgiCvD
	O0KuHxyEnJ896bA+F/1zrvKEHaKMAlSXzHpoU3JYkaWkKCbxqN8o9SyjqrJrxUpJXVPeVufWTYA
	fkf2j84QbG1na2WL5KS4+cMUyyQG7Hnq8CJBIYyNoehOyneGp34wCqtjvLkDnRJc0keYvcl/hO+
	uasqmLQOWJ0XK72gqdrU7wDmnCmAL9kucY9CGXKDwzYaJ7nd5vOJoOA8IBG7QUdxIZFtM3i9Ayj
	nQKoH4Lb3QKtIo8UJh5greL84wK6k2g4ChDzno8NA/BSwQqOoM4OkMxUXBhyiyL+zsoE0Il5bxW
	ifFPXHhOKV1cInXm138ejBXvupa+dHqUPSCkjYkvCi9CJv2FXZ5cvKRPMW1D/ORGldBbY=
X-Received: by 2002:a05:600c:a45:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49e619bfea6mr52704735e9.18.1789130252515;
        Fri, 11 Sep 2026 05:37:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6687a1basm26762985e9.12.2026.09.11.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:37:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:37:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [bug report] gpio: Add ChromeOS EC GPIO driver
Message-ID: <aqP2CHazflMSQrfa@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Stephen Boyd,

Commit f837fe1bffe6 ("gpio: Add ChromeOS EC GPIO driver") from Feb
19, 2024 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpio/gpio-cros-ec.c:131 cros_ec_gpio_init_names()
	warn: expected subtract in snprintf limit 'name_len'

drivers/gpio/gpio-cros-ec.c
    97 static int cros_ec_gpio_init_names(struct cros_ec_device *cros_ec, struct gpio_chip *gc)
    98 {
    99         struct ec_params_gpio_get_v1 params = {
    100                 .subcmd = EC_GPIO_GET_INFO,
    101         };
    102         struct ec_response_gpio_get_v1 response;
    103         int ret, i;
    104         /* EC may not NUL terminate */
    105         size_t name_len = strlen(cros_ec_gpio_prefix) + sizeof(response.get_info.name) + 1;
    106         ssize_t copied;
    107         const char **names;
    108         char *str;
    109 
    110         names = devm_kcalloc(gc->parent, gc->ngpio, sizeof(*names), GFP_KERNEL);
    111         if (!names)
    112                 return -ENOMEM;
    113         gc->names = names;
    114 
    115         str = devm_kcalloc(gc->parent, gc->ngpio, name_len, GFP_KERNEL);
    116         if (!str)
    117                 return -ENOMEM;
    118 
    119         /* Get gpio line names one at a time */
    120         for (i = 0; i < gc->ngpio; i++) {
    121                 params.get_info.index = i;
    122                 ret = cros_ec_cmd(cros_ec, 1, EC_CMD_GPIO_GET, &params,
    123                                   sizeof(params), &response, sizeof(response));
    124                 if (ret < 0) {
    125                         dev_err_probe(gc->parent, ret, "error getting gpio%d info\n", i);
    126                         return ret;
    127                 }
    128 
    129                 names[i] = str;
    130                 copied = scnprintf(str, name_len, "%s%s", cros_ec_gpio_prefix,
--> 131                                    response.get_info.name);

The name_len is wrong because that's the total length but we should
be using the remaining length.

    132                 if (copied < 0)

The scnprintf() function is a kernel only invention can never return
negatives.  User space versions of snprintf() can return negatives but
the kernel versions cannot and the kernel relies on this behavior.

    133                         return copied;
    134 
    135                 str += copied + 1;
    136         }
    137 
    138         return 0;
    139 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
