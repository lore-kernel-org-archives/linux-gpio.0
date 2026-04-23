Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60A03CBE6C;
	Thu, 23 Apr 2026 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919906; cv=none; b=aJtiYDC+BNuFfKv54CN9Brs/HQ4rIDAh9/xD5nV+8gT4tKBCuXe0ziDlNRjVBmPIX6Ke6Rw0MQVdPXt0Fk0HTtEHStPU9xCiF2mAooucB9vpvaMc4ytUryV3GZAjHzWsTxaCcidqULyVzF2J8INS2grP3lPwjAAoBenFNFwdFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919906; c=relaxed/simple;
	bh=lrj6jOsTI6FZkRh6drcW/yTqZiFHlc2sG2eUWM591HQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUbIp4HfWMeo9cgne+R8axnx26VNRfQCUj6CtYymRaU8sf6brk0yrllYqZzgL+2fWEqkj2+0fTBsQBmIHvvKqaofDFYo67TZq/96Wovc+Ig68Pi55kOb+w04HFS1AbnwIBVnrpiz981L6Fq6/WF75Dg8zmqpXUXdeU82tgJgozM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=YKb9qgvN; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YKb9qgvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776919902; x=1777179102;
	bh=lrj6jOsTI6FZkRh6drcW/yTqZiFHlc2sG2eUWM591HQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YKb9qgvNWovv5TjP4Bt/bh2xTSDtPDUgApRbD3LnRHSFawqZUCaibN/wd3N9K6hsW
	 xkxdYfHOXP7CtJ7Hp9np39vtMtlEn8sDh1y7K4gijhGhBj+a4rFUfwv82UFj2hkIwL
	 9zIdIMaM1uQLO8z+IvuyOa6LEurWWC54VGMz3S+W+B9r0Mi3xUNjyeexD6GXHyVTDR
	 13zbRE8XNmJ+qCikGNM5tr97n4GGfK+70xO2n3dMCaQfbifErErXlsPublPYVaxvYt
	 ayyoQDpjKs7+lO8eGEY5EgUtOTS5ilQtK5DJOZyxPv2sMzdRyNr1rJRycPeStLsWrT
	 hjj0vtWbBjyXg==
Date: Thu, 23 Apr 2026 04:51:36 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 1/2] pinctrl: qcom: eliza: Fix HDMI_RCV_DET function slot
Message-ID: <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me>
In-Reply-To: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 277060cf3c070fe75af9843470e655037df09ea9
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The hdmi_rcv_det function was placed at alt function slot 2, but the
correct mux value for this function on GPIO 19 is slot 3. Move it
accordingly and leave slot 2 unassigned.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pi=
nctrl-eliza.c
index c1f756cbcdeb..b3413520a115 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -1305,7 +1305,7 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[16] =3D PINGROUP(16, qup2_se5, qup2_se2, mdp_vsync, mdp_vsync2_out, md=
p_vsync3_out, _, _, _, _, _, _),
 =09[17] =3D PINGROUP(17, qup2_se5, qup2_se2, mdp_vsync, mdp_vsync0_out, md=
p_vsync1_out, _, _, _, _, _, _),
 =09[18] =3D PINGROUP(18, qup2_se5, qup2_se2, hdmi_pixel_clk, _, qdss_cti, =
_, _, _, _, _, _),
-=09[19] =3D PINGROUP(19, qup2_se5, hdmi_rcv_det, _, qdss_cti, _, _, _, _, =
_, _, _),
+=09[19] =3D PINGROUP(19, qup2_se5, _, hdmi_rcv_det, qdss_cti, _, _, _, _, =
_, _, _),
 =09[20] =3D PINGROUP(20, qup2_se6, _, _, _, _, _, _, _, _, _, _),
 =09[21] =3D PINGROUP(21, qup2_se6, _, _, _, _, _, _, _, _, _, _),
 =09[22] =3D PINGROUP(22, qup2_se6, _, _, _, _, _, _, _, _, _, _),

--=20
2.53.0


