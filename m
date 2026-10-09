Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C32D8391;
	Fri,  9 Oct 2026 05:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524758; cv=none; b=Vmoi/H3Tu/LKYNhcEg0qYPmiVf1i9luRn3e2qnYZ0yH5CIV8UDEwDnM+v2njsMCNQmumX+0oSxhhiM+CPX41CH2wzR6RNt+VleVXkXcbuCryvwh7UM1hVMUraklJZIJvMccxjA2sK9RWv9jnngIJhKmaDmKKv/psZEXIWBPzDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524758; c=relaxed/simple;
	bh=lyVy0pfJ6R6GUzVQef0B/Ra6Q+/nG/TdqyVcbWcL8Ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q7qpNgVAf+tan5YZz0+WBtYE0abfMfmwBOWEN408omdENfClS7tv+wbvVBSb0wXsMcTjutuawmjQJ8etgAjvdbOZGwBIAuZRptqqEalSezk1MxSBhaF6tsuXXfOQgxUHBKsjq1PRZrIfGWt/jdQIFn3KKL9Iyi3UhZYVNZFnsoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAB3gD6Rf8hqb1IdCg--.22265S2;
	Fri, 09 Oct 2026 13:45:53 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: core: fix pin name leak on radix_tree_insert() error path
Date: Fri,  9 Oct 2026 13:45:56 +0800
Message-Id: <20261009054556.3151123-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3gD6Rf8hqb1IdCg--.22265S2
X-Coremail-Antispam: 1UD129KBjvJXoWruF4fKFyrJF18CFWrGr1kuFg_yoW8Jry3pF
	ZxJFWYyr98Wr42va98Ja47XFy3Can7uryxGw4v93y3AF43uFyqgFWYk3W0gF4DCrWrA3Zx
	XF4rA3y3uw15ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8SoGJUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwgPA2rIaDU-ZAAAsn

pinctrl_register_one_pin() allocates pindesc->name with kasprintf() when
the pin has no static name, and marks it with pindesc->dynamic_name.  If
the subsequent radix_tree_insert() fails, the function jumps to the
failed label, which only calls kfree(pindesc) and never frees the
dynamically allocated name, leaking it.

Since the insertion failed, the pin is not in the radix tree, so the
caller's pinctrl_free_pindescs() cleanup cannot find it and cannot
release the name either.

Release pindesc->name on the failed path when it was dynamically
allocated.

Fixes: ecfe9a015d3e ("pinctrl: core: handle radix_tree_insert() errors in pinctrl_register_one_pin()")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 1675dd36bd5c..3a1d1ff871ef 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -249,6 +249,8 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 	return 0;
 
 failed:
+	if (pindesc->dynamic_name)
+		kfree(pindesc->name);
 	kfree(pindesc);
 	return error;
 }
-- 
2.25.1

