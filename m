Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606715;
	b=xY71TIydPH6o8hjBcUfD+bGSRwJ+oiTXRLRz8kk4+7MyjovVSYzqk2P4uZjzlyX0YW/e
	 CYZRmLTH205NgHF1iSvfYmXE+xJt1mtcylFtCJkyRae5bQr8MtOFminwj4bwj/+Nv3I+T
	 Okcc1n6vcqDXIE0ufWisLHUbvjMdEZJCSN4toIxJUPKJviNjuA+lgz2LcGh0dRNef1u5W
	 F9e3l/iWR20JGQ99XKInZfzwzxc0Y/JY3PKg9I7hqvDsbgOnOSL35JbThiMvwBzqkFsUs
	 VXpFXBkeElJseEbK7AU5Fwz72dlM0QfqsqlpKpa3gUuH2lUkuw6ori0bpBRQrQf6cCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606715;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZfR/6lnsUE/pnRQi/PbCLWIsXUsmgZSZZiyw7HHwysA=;
	b=axc4hfUG0LQ8FHRbyZMtDp61v+BAe94MV82CoqDebtPs5rdCsvSadxXR6OOvswGjp/Rn
	 HxYryEb+CWcY3cp4XnAMc4BcyoiKlUie1zkwQVKYpKZVm+CXBbRDDHhLolUsqfh7fGnWa
	 GuIwi1xK78R+bt1569G9BLx7sfMYEvfpfHzVYUgGjaoi+W2QBHtF3UhTwWp87BOU6AGeO
	 BAHpJATSZMVFPEX+crBCiOCE4S41MadZJdJsTqfFvIQ2lmXeLvxuiqkggkskgWDjGm+gl
	 frYkqpVZ/k6ppHJRNO5Fd+h2k5oFA4VQuc2b2n77LXZjYktdB0BDpJVjFxF6H25NYLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=cy7vHFNh;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCFC606A321;
	Wed, 25 Nov 2026 11:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BCFC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=cy7vHFNh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=ZfR/6lnsUE/pnRQi/PbCLWIsXUsmgZSZZiyw7HHwysA=; t=1795606714; x=1796816314; 
	b=cy7vHFNhBcTO4lOMVOOWJQRSLbI36ymlJOhbURxnSkoGLZguTsia+N4GyBQCONqX931/23ey8XH
	VC+gjVr3Fv9YuiMqHXIKp4A7tFTlY5kBGB7yanXi5kBggSZ0iN2WfrgwrhJJbg85SWNzwlioT1BrK
	8411xrSyPJWvVi0g8W0x+CsuiLT1hS6E9jKC3MlEykn7Ymx8Ft7iQgzHNxmezDHdgDsJQgNL0pc7i
	KzW4d9BmWzjh17qSfFFrTmZXUcluYGCzHdmKkiVQwvCzBSvJEnnBs7aD1Z8XsuoTR43VURFd6QRPC
	R/hPAw88hwf8nS8jD7wwLa3iDM5IlJYSCzlw==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Wed, 25 Nov 2026 12:37:21 +0100
Subject: [PATCH v2 2/2] ARM: dts: st: stm32mp15xx-dhsom: fix bridge reset
 polarity
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-tc3-reset-v2-2-32eefcaf1460@kemnade.info>
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
In-Reply-To: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@nabladev.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=GLBUHsrqFLUlRWZt8GXXwr1nDsTd3sjuIa8AxQT8QUI=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBsicxJ39BdQawPVS1vsqyb5pVVpsEPBznjhCy
 lM2FgQvhcKJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawbInAAKCRCEYUX6QCjc
 8X6uD/9Scm2vnKjdVnjiK5Wq/OAU/DMB13MUnnPQJBPhn+RvKcdBp1h/Bl4EO4jPp4H4/GoiKve
 vD0lq7mk5bkSwVuIs2Prj/GRLhLE6+689XkMZeMnn/4EMC5KojJKgllX4fsxY/bm3hD7Opy0nI3
 iIh3JeJisk29PvsHfXFjBhMmZyZg4r32CRZ05Mobm4JXdbEuVkk5pKW+r6n7XcGbdJdr6IDaw0c
 cOVlrOPiJ3+MdZmXv/o3Is+prFMav19unYmeqVgHmb6DF1WbxCAMI2dSP+hkHviyqyYWYaiykSG
 HWEEhIABxryHExQPvnGtLaN0qiJbLAg6aAm4B4iLe1Mb1M1TmnR2HNYMBPzPBlvPR11vxPfllYx
 qvzn+vIyJ/T83NAGMyHxx+KGqun/XBG33sH19RzTmV77MfBfOT9JB53BfWpXY+EPdUFbM4grLfx
 fnrNweEdrr/aOIaI5Bi4HVGpU3ADxNV4VvY7YVN56SGRm4TOE0SD6yIHb1vDRVN1XBtpu9gqrsu
 xt/l6fQD9/9o4SAlFtWM879aOj4U4r6GG406AalpbLhdTAz5AyLJEqr0YZ2JVFm8JAqQfK5w/bm
 Q780iaMF1ec4FyGszAoWNk/IyRfXKRqVxumnvmUtkBitCLKy1DqlZP3ZZNGZ8YcORRNI7ImFDSW
 v41YspPCfrD4cCw==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Reset is active low. It is apparently set to active high to work around
a driver bug but not to indicate an additional inverter in the signal
path. Correcly describe the hardware.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
index 518c269a1dba1..6342a6e757c12 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhsom-overlay-panel-dsi-rpi7inch.dtsi
@@ -35,7 +35,7 @@ &dsi {
 	bridge@0 {
 		compatible = "toshiba,tc358762";
 		reg = <0>;
-		reset-gpios = <&attiny 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&attiny 0 GPIO_ACTIVE_LOW>;
 		vddc-supply = <&attiny>;
 		status = "okay";
 

-- 
2.47.3

