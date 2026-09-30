Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C8935C691
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744314; cv=none; b=f4e5E6q4amP6J6p/4DkCUciRTCbbgfhyahYJP4pZR5WbgXi5sDJu1PB6lDZNnZ8RX8JAWhmt+i0DPRW2rS/MsSfFxNlCSKAJMoWvjol8hMMUXgzvOiPQO55m+1E5RPY7oyb2gKYR5x3n+Fr9MXa8k/uy+0BM1pminjQFZ7l3P/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744314; c=relaxed/simple;
	bh=+d/B0EyrO8v0rwBj0UZLa2+ev9ays+neQ9d64Tmh2Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CI9KqPIagMN6wjcbCRyfb1z91oZFGJuT700KGdahYOCc6n2AwLj+fAu32EQwqUOZUGsPVkLMdEMpB7t54ZaAjy5BRdc61VchJcYP5KTwG1668jv08zoNIb+zCRyAoDTUVln8kQv3YJ3nbYNol697nmv8FEqCUXsqdHHbC7XleXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuScn2ZH; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuScn2ZH"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so2814940eec.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744312; x=1791349112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wb+aoLgtZDdjk4LEKDzfD9vu8cYmjgubpEwv6XHPhUA=;
        b=kuScn2ZHHF3foKiN8FH1xy+vWAlZKJdkctLkRj+adF+y3yzoG9PRAI9s086WXBsFBE
         qqjsZ5TMZLIV3htzDhXfoAdjwiPhym4xZwJyMV1P0Lifh2QyHB9MThwTIQrzUQBj6PJf
         J/SuaDXwyg380flSR84s0RactYKWQfvlkz8ayTYEbmp0zpdJCjmbrEwBL6DxHdPJi5S3
         7jK8ansnVVEA0LgTBgXXD2VzxnfqzilibWW+YYdn56fCxc16ptNXrWjl1b913ocnudci
         8AfPj3xMCla1AJlvZMJb2fk7SqGRYqhpnCPwpzlb6C6pFsUZkUfTU776JuCMPaTY2vhS
         5fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744312; x=1791349112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wb+aoLgtZDdjk4LEKDzfD9vu8cYmjgubpEwv6XHPhUA=;
        b=xc8k01GKyKFkEIwmj+NUS1JWSZde7MatxmdOPVyUji4WtHOM2S9+7y7ty1oGkzVX8s
         2OYuM8ZzfosJnqedjW02qxEl7lF8Kce5fQ0uPbexZ1TBLKkIGnVKfDsAWdEEizpG9OuQ
         Xcwyu018ml+M+Im393Ha2bSQ3QASJ3dAYdge/jNOcgl25Cc6Jup6imjgPuGPNkUESzUf
         zBzWzc4ojhOQylY7necgPbct5dzdCnmoOqO4jz0uo7WEiUiB43Lg3nTO1TvitvqEbShk
         62MEekOpZhF04j4NTLuLTWRndYoSCxSFgmZv3qzBlD/HJyml1f9S/1saY7H6LCwp4ejT
         z+8g==
X-Forwarded-Encrypted: i=1; AKwUvByyrt3QmHH3dPfuvfBxrXRZEFiAb58zbSHol7+VGPVBLjliauamsrM1Ml3nsPHd13FCs1NBaDna5O0E@vger.kernel.org
X-Gm-Message-State: AFq9FYK88lPSJhG9dQY1e3JJoNbqHaGIqCuZREOKa1AaQxK/KAkHfCWU
	HjiJfbCUFFzCWWTkKb0/s5Oe68Kb/uVz+u30W7A9XiS94C9QbijH1njl
X-Gm-Gg: AYBFou2FM/LE4LIa5xCQNrHva69TSnczJpTaULCxhCJ+jxnm50SR4L73x9nVFFPBak5
	/JT+1tbrg7fKru6fYvJtl10OoF2d9klHdnxQiFJwJIMZBuqYSnIgfYnnNhfvIyLJWtD4E7ALF9A
	54VQFJweOVX0+jXVCJdkJ5pg65tM4FOrdB0Cd2A9DyaUamteUpwPytHc95iZvih3blOJvVlxXcv
	pV26Zdu642G3BKJwzCjmKl2wD7+4k5ksoBhk4SQJHB2TOPNO4aLHODOUNHE30OxZfX7TsFcDT3h
	KldNf8i+9ig2O6icK1ILs5CbyVo5LYa+hYTp6rLuNNsRW2tcKxcGn1fEkvXa4QNKj/arjhKZ/wg
	NJfmRpKK8RU/cg7nBQKADwLlG/Z/SQTUwCTrC96xGQTOZPVOkK7Aj2RuxYBskqvb6U40NxHyl27
	AT/AY9UCKgLa8wq/7oTWUjL7YJG6bBvfc8ODVtW2SYetphlHgq4exzUcaTL4nVwyU0Iqlw87CCd
	DSksfGPzd80RvERAgNp34Df4f36dmb00+cXetU+DIPhG13oVUoMnxssf7v6SoQ=
X-Received: by 2002:a05:693c:83d9:10b0:33e:518c:6837 with SMTP id 5a478bee46e88-34cdc4cf951mr526549eec.24.1790744311778;
        Tue, 29 Sep 2026 21:58:31 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf514b783sm571056eec.13.2026.09.29.21.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 21:58:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Sep 2026 21:58:03 -0700
Subject: [PATCH v3 4/5] pinctrl: renesas: gpio: support software nodes for
 function GPIOs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rsk7203-properties-v3-4-02f84aeb8e47@gmail.com>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-6c14f

This patch extends the sh-pfc GPIO driver to support software-node-based
configuration for the secondary 'function' GPIO chip.

While the primary GPIO chip typically uses the firmware node attached to
the parent platform device, the secondary chip should target a specific
child node to avoid ambiguity when defining GPIO hogs or properties.

Update gpio_function_setup() to look for a child node named 'functions',
but only when the parent is a software node. This ensures the behavior
is restricted to legacy platforms being migrated to software nodes.

Assisted-by: LLM
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/renesas/gpio.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 4e59dadb7364..b49a3e14da91 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -271,18 +271,40 @@ static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
 	return ret;
 }
 
+static void sh_pfc_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int gpio_function_setup(struct sh_pfc_chip *chip)
 {
 	struct sh_pfc *pfc = chip->pfc;
 	struct gpio_chip *gc = &chip->gpio_chip;
+	struct fwnode_handle *fwnode = dev_fwnode(pfc->dev);
 
 	gc->request = gpio_function_request;
 
+	if (is_software_node(fwnode)) {
+		fwnode = fwnode_get_named_child_node(fwnode, "functions");
+		if (fwnode) {
+			int ret;
+
+			ret = devm_add_action_or_reset(pfc->dev,
+						       sh_pfc_fwnode_put,
+						       fwnode);
+			if (ret)
+				return ret;
+
+			gc->fwnode = fwnode;
+		}
+	}
+
 	/*
-	 * Explicitly mask the parent's fwnode to prevent gpiolib from
-	 * reusing it for function GPIOs.
+	 * If we did not find 'functions' node, explicitly mask the parent's
+	 * fwnode to prevent gpiolib from reusing it for function GPIOs.
 	 */
-	gc->fwnode = ERR_PTR(-ENODEV);
+	if (!gc->fwnode)
+		gc->fwnode = ERR_PTR(-ENODEV);
 
 	gc->label = pfc->info->name;
 	gc->owner = THIS_MODULE;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

