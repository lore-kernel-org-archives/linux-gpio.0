Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4458719C54E
	for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 04:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272206; cv=none; b=HLyIHrAbChK8NaxfV0V5au4YsdutTLbR1vsJfOuBiM0+pntv1xpo7X1XiNsyCdHem+chj0SrbWvradqOuLjVnTk3C6t4YsjNDafldlkElU6uOR0f2iMcTT691VuI3Hg1PCbtC2R46wKUvgZwylmi3JfvxPPhiy3lDZREPt6S/M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272206; c=relaxed/simple;
	bh=4eRp9ovMmpBudHPEfFmH+GHalK0lB41ROHYez3TAZNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/3TtvtPEGliur3B5RNpiWjeHYHg3bCyJ8s3MZ4ZmBhv3qvgvfkEPXYdgOpqNi1Fl0DTbxryLivk+eSKfje57OiBvOfcl8+Rl1X1yD5QLdz5yGOQrQQ5m5Y82C5lRxzGTJGkBDMtHOafcKIUoZLxwe5t6ULnPXqU5UlG0Cu7nC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMhXzdm6; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMhXzdm6"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ef19aso13538411cf.2
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2026 21:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272202; x=1789877002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0RPsG5ANJXum6qiiDCl2HWvCcb2vrljQ6NDoFmQS7k=;
        b=TMhXzdm6RzpAgkxS+iTTvqN3G5kSltF00lFB5Kbi/uQR198rm9I0AR3iXHxhppdPDs
         McHXclarAr14t49ntxVMGEkvpWBKPwtsC2u3zDE6gezdWZq8ja5FJ1X3OOaSBAtzlum+
         HxutLO2DEmZM+6ZRcPK2oS1oKo1tNQ32jgK2ZJuURQEDWvqFsJafhUGVFJQ8UNKW6XKm
         9AHa1lKrQmRjoB+gnH3go/BvzbPnyW5M4YKOrZyFkbKenk2/oIXRTI7PxdT6jezfayZu
         Ip1RsZQ+Pm4wrfCJMJryenGrNSoAAPz7HBkKbp3mzNBHyV72NUBSpjNOLd095WHAASla
         vjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272202; x=1789877002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0RPsG5ANJXum6qiiDCl2HWvCcb2vrljQ6NDoFmQS7k=;
        b=FBIg+4NadtUj9TfgE+Nx1Sh0n0LSXaFnZUG1EIFTgFfvQKc0EPGCR3+gPPNCAks/cp
         BNc4Te76JgLdQT491U0CpuuNN51/9SY2z93lKUcMEjJy7pMgUWhu/j4ySq4w0ymgswHJ
         ZwYKrtXrADuxwtlkxoQyDkL92lwKolVQ7wAEqFQ0VxqKNqQJi2SZCqL97moN4SBub9DW
         UkkR9eeYDB/N31/tgtvfHfupXwzBSc0ghUWSYMV7ZYQeLD4z46WeyQkK2LZrE3eS8RAZ
         8nlacwGaro4hktnVI5UGQQ4yZkguXiR/mkncaBFsxmkFP0O3tPHCgEGDhSpvA1Umeiro
         FXUQ==
X-Forwarded-Encrypted: i=1; AKwUvByhcHoQXhglTLRSSf93YRCFRbBOMg1vk6bta8uH9cgS217y+QUa7W+SZjol0OupHbLqChUUuy9aOzSy@vger.kernel.org
X-Gm-Message-State: AFuF++kwAoDc+PTnLXeN+0ExhsNOvA+9O8N/kbs4XPC7pmC7KOCLP+jf
	8WCQw971aCxtiX9LZW2WfhZxBUVUd6F0FNuwLfx8hSsiYSlKG7pzd9l0QwwFTPm/kA==
X-Gm-Gg: AYBFou2bonFaoreDiYqaRjIaD+63aNA3E7yhjP0bgDeqdMi4n8mhw2VfExzTzmHOxFJ
	ylT4DfyTi/6xw+mg1XxprpZyGsIbfYVOhMyGXMqM+ga5mGn0Y9uMpXp2NJKzmjqk6Jr7TeRHZQH
	B7aTvhz1ycL0e3v1wu3IFCmlmcXQNZ/PeBisLFBJSwqOsoeJB8J+3NAMikpBsub6+wBWRRD0I7W
	bCL1+RWOlt+MdBlGqNO/qkURbwqbdUUppmaK/8cSN20fu0G1ddIssxvN//CJsnPROburzs7tQPK
	Sa0RUKc7nhk6oMIwJ2jAsOtxrzJ6yR8gOSOIxRgutGwWUN02W+kVBhMU0vGkYRMzxhZn4D/UU6x
	4AQcpi2Q4i/d+hi2kqhVGI/5KlrL55elcD3ITe40oj4pz3MVlG46oUww6CnF4Ij8KFkLVXTFmMz
	vBNNT+dywBjgnYCT/ZqZvecC2GGWKMBXXWPaMDp+qu7EjAGG0+G1MIISnUXw1AurVeP4Ik4zN+r
	9DnWBzb9IS23il0ZN4FM12uqRGmrpftbfUNrR+43vvc/sDRQBOD8vTRHMYYnV594QWArHZJGjc7
	wefYPsh/hjiNAp6peRkHjcQzWAlDnMg0dQ==
X-Received: by 2002:a05:622a:507:b0:527:631:8d6 with SMTP id d75a77b69052e-530c859b38fmr160895371cf.25.1789272202056;
        Sat, 12 Sep 2026 21:03:22 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm62329021cf.9.2026.09.12.21.03.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:03:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] pinctrl: single: free the IRQ on domain creation failure
Date: Sun, 13 Sep 2026 00:03:12 -0400
Message-ID: <20260913040312.21966-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcs_irq_init_chained_handler() requests a shared IRQ on affected SoCs, but
its domain creation failure path only removes a chained handler. That does
not release the action installed by request_irq(). The probe can continue
without interrupt support while leaving the shared IRQ action registered.

Use pcs_irq_free() to undo the appropriate type of handler registration.
At this point pcs->domain is NULL, so the helper only releases the parent
IRQ handler. Then mark the IRQ invalid, as the other initialization error
paths already do, to prevent another release from a later probe unwind or
remove.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 3e6cee1786a1 ("pinctrl: single: Add support for wake-up interrupts")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/pinctrl/pinctrl-single.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 4d5f85b7e..e0eb7240a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1628,7 +1628,8 @@ static int pcs_irq_init_chained_handler(struct pcs_device *pcs,
 					       &pcs_irqdomain_ops,
 					       pcs_soc);
 	if (!pcs->domain) {
-		irq_set_chained_handler(pcs_soc->irq, NULL);
+		pcs_irq_free(pcs);
+		pcs_soc->irq = -1;
 		return -EINVAL;
 	}
 
