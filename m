Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D23BED11;
	Thu, 25 Jun 2026 06:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367805; cv=none; b=hlw/hCB+uNpXW0Ft/xkphklUAoEnIdlrY6KUq8IaqQ3E9m55jbV5UzhNJPbUXeP81By23QLhUMmR+vAdVUMkvd6np/4Or6TnnUYEMxU/G/pYE1MhgoEPbKdXShAoKZ5OqyfgCHBEwaeFC0MQ3RmoYqOYvDc9SE0yB8PLz0nru/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367805; c=relaxed/simple;
	bh=cyGSGyUWlFCS0+PoP5q++7pVilaBrIyue7rbPzVLGZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHin9si+1KwBmBaWZLXpNGUzqhl8sPEZEWQ562RPRTblO/lNwCYki3Jx4c9FjALqNeqFmtAtataco2KAwLw5vweiEZPBzGWlZFiZzv/RhfGQ6TFr5fSG5bmRFSGQ7sZo/dkXrr+QcEGQwa5HR8F2K6YqLWKCh7rR4oRzigwpTBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABXr9I5xjxqupcoFQ--.8635S2;
	Thu, 25 Jun 2026 14:10:01 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Paul Cercueil <paul@crapouillou.net>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC] pinctrl: ingenic: impossible MACH_* guards can drop OF match data
Date: Thu, 25 Jun 2026 14:09:59 +0800
Message-ID: <20260625060959.17290-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXr9I5xjxqupcoFQ--.8635S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gry3Jry5Zw4xJr13ZF4Utwb_yoWkKFbEk3
	Wvg34jvayUZFWrXa1Y9r4Utrya9ay7WFyfX34FkFyI93s3ZrsrCF1kuryavw1fAFyFvrn5
	JrZ3Z34Fk347JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUIfO7UUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi,

while auditing conditional data-provider paths, I noticed that
drivers/pinctrl/pinctrl-ingenic.c still derives some SoC descriptor exposure
from IS_ENABLED(CONFIG_MACH_*) style conditions whose corresponding Kconfig
symbols do not appear to exist in the current Ingenic Kconfig universe.

This looks like a data-symbol legality issue rather than a simple cleanup:
the OF match table .data entries carry SoC-specific pinctrl descriptors.  If
the guard can never be true, a compatible string can lose the intended
descriptor provider even though the descriptor is still present in source.

I am not sending a patch yet because the correct policy is not obvious.  The
possible directions include:

1. remove impossible MACH_* gates from the OF match data;
2. restore current Kconfig symbols for the intended SoC families;
3. split unsupported legacy SoCs from supported descriptor exposure; or
4. keep the gates and document that these descriptors are intentionally not
   exposed.

Could you confirm which direction matches the current Ingenic pinctrl support
policy?

This is static source/Kconfig analysis only.  I have not tested the affected
hardware.

Thanks,
Pengpeng

