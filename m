Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D25733E
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 00:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784334139; cv=none; b=BtNL4U1XbLFkwEtCOiayWSGgLsOdDRLOy29mtf6SWTbOwDILBKi+ShskPB7bY+Acn3/qF1lgsM8QXCtjBfpvbRQTXgyx/WPR1Qp7nhZ/nOFtkNZNpL0FbWyLamaPo7faBZHM4hv1r11Wj3WSq1yImzyuHEw2S4epN9VQXwX+Q5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784334139; c=relaxed/simple;
	bh=csB9LW5WHw0un70nxzrglTex95/RRB8IvOAAZHtG94s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QK8+RotGZYHHSmvb4pzaFGwLzj0bo0ORkUx2u69LfwzJfDgrCmHvLU0XHmVzkkz0zUTt+jFiBHrC8KVZsocHu5olI7kdidSlWrDg/jl0nEIHIuKocbz+cLcbfqBvx/ctG3mVF3jY2wUyNxZ8gcutCfJviqOU4L9kgWXsTNhSBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+8I9D8Q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+8I9D8Q"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47122683cf3so4901084f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 17:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784334136; x=1784938936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZebbFaWsy8eWuCYvjuH4LuGSdt8lE+CXg5X68CJPwI=;
        b=l+8I9D8Qz79dvYxf1e9jG9Sb9esgjOCkgi25Nn5G9duE5Gpe6ZFqqti+HZ4pFfawA3
         CamTKFPF4zhFbjGMtpDdJuHt+bpKsuPeGmYM2myCxFpUgLOpoOyKDWNIKG3CWDeZEqYB
         AqNGiV7OEZS6bso/MnDE4TB8CZalmoszXmxEjNuwbBczXWXsZYQu1aCPKySGxOT0RPRC
         I1lyi/hS1Zfj9Qlq9WB/VBlTDSEuIP+D8nBk1o835oF0XBiYjcCNyzRc11PJiTeEkptX
         juGkryJ/SFTu6u7/6HUD5BlOlz+473HAvXsnjjfbNMCsps2ZAqI0WAJ5Eji1FNFwjXTi
         LVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784334136; x=1784938936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZebbFaWsy8eWuCYvjuH4LuGSdt8lE+CXg5X68CJPwI=;
        b=kMLZJ0nU/QO90nNqHeZ+Ti8rGODkGB/mVn0o5rWRkMwK3YiVtWI/SW6bukuGyklUar
         8dEyJyv54OKtmvgyrBsaI7fVqobwQtgnp41azVZd8lCbekBSKJbs1uLDaOF4q2CiWrSa
         OfgIoYbJfQbBESYjm731jFEJubLR5+ajTwdxCcwumR3OQpfZnmfTGOlSS51+6y4Lf04s
         NyZWwBEwTRcvYwfRiRRuacYP3XIOUhgatOIL2C4+FZdMccmwQsvGtbey8QmjRXPSyGt8
         kBy4qXolJ5regCqEd/xPzV4I9ruVeiUs4HHHRR6/EgxDTAoY6FR8mQA8js55bHRrm1a/
         IVHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrULXOn4LyXgWb9O+8cIkH7UN2ylu7bhZm7hdEoYLdA/y5lPcSM4Goal08lv/fKC1fDcJWDFAckd1bb@vger.kernel.org
X-Gm-Message-State: AOJu0YzvODFuQDvpjUERmpSjazwPR9y7RdDfwDFmHYeSK9NsJuPuhOY4
	QkJ4BVHDcC2Gz7kj+NF6qY8Luvq/BMQev1l0uwaofWHurYFpW5TR/tEk
X-Gm-Gg: AfdE7cmGtsxkNe52y64iKah+KlHmmmji87D7S2HkPLiz3h409DJNf/SgPCvvGC4wx8v
	e9b+lW5N1jK43JkFRP5iZxZiLTN8IqwsknfDFqCbPQh3VhG4jzbBk5AE9xurqEg9XkBWe5uK7D+
	g+HJ77OMI93UwTr4r/R665ntziR5sUk5EFC0I6n6OU04J1VJfuSJAXXY7WNgFyWpWLjz3Uk7/Zt
	SWU4cMDzc/2ldKmnWPMjXggZzzh3f0v9zp3/n4pKWt0gKexIob+y0PGZrKE/snAPTWEsoG26aCJ
	VaBNBZvd29KqZGZW3mRyldlUGoVAHTP3P/jvU4eaUnIN/D1mQgVKVHuGcYBFBQ2aUcf5UvKXSL/
	i2t8jQvJ61lBMsWVMqEAhrdAeGnNxm/MmovFALIz/ZenADJKP2tsHZfZkPFvSELNO1f76JtNSVe
	69FAHc+vtJ6Hnw/FoHISoKfBEJ3XNSuBXOYWM7pGm8LqbddrbWbEK+SeWUq/WBxLhI6MfLZDA8H
	jHjP9dT9SSkuHwtc5lspj9D/3GKp8MBsUnKfGGlkyNdksumBnhGew==
X-Received: by 2002:a05:6000:2412:b0:47f:6103:e0c2 with SMTP id ffacd0b85a97d-47f623270efmr6122555f8f.35.1784334135843;
        Fri, 17 Jul 2026 17:22:15 -0700 (PDT)
Received: from spaceship.tailf1107e.ts.net ([2a00:1d36:1938:ea00:6509:ca16:7c02:4e47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eea8afsm8504757f8f.33.2026.07.17.17.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 17:22:13 -0700 (PDT)
From: Taceddin Sancak <ts.solidarity@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taceddin Sancak <ts.solidarity@gmail.com>
Subject: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins
Date: Sat, 18 Jul 2026 03:21:46 +0300
Message-ID: <20260718002146.698973-1-ts.solidarity@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
"gpio37", but in the pingroup table those functions are muxed on
gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
This makes both functions unusable: selecting them on gpio39 is
rejected by the pinmux core because the group is not listed for the
function, and selecting them on gpio37 trips the WARN_ON() in
msm_pinmux_set_mux() and fails with -EINVAL because that group
cannot mux them.

Point both groups at gpio39, matching the pingroup table. This also
mirrors the primary audio MCLK pair, where the mclk0 and mclk1
variants live on separate pins (gpio53 and gpio51 respectively).

Fixes: 3c8e7ba0e399 ("pinctrl: qcom: Introduce IPQ9650 TLMM driver")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Taceddin Sancak <ts.solidarity@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-ipq9650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq9650.c b/drivers/pinctrl/qcom/pinctrl-ipq9650.c
index 64e443aa31b2..5399d7ad934c 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq9650.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq9650.c
@@ -310,11 +310,11 @@ static const char *const audio_sec_mclk_out0_groups[] = {
 };
 
 static const char *const audio_sec_mclk_in1_groups[] = {
-	"gpio37",
+	"gpio39",
 };
 
 static const char *const audio_sec_mclk_out1_groups[] = {
-	"gpio37",
+	"gpio39",
 };
 
 static const char *const audio_sec_groups[] = {
-- 
2.43.0

