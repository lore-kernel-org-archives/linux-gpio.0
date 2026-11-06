Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948804;
	b=X0G+fHGW/zSRKFDAyA4WE7VATEjgDT22y9UWevY8SncBgJjkb56s247atxUItUo5z/OE
	 ydCa0zlb4+eAvsjoxVVoTWCxlrIPSI0yplfyKpbzRQ3WMpO52WGDMg3hkiZ6xrtXZwZAj
	 GRn9Pxy+fSZ5KwJ/hvM2vFt4sqt8uqXAfSmGRaTRtfCNdiwxxir7fHCL+PGTU/diFQkzz
	 7VPqrUQfxNfFd+HhX8HAOreEal2+3dopcj7fHBqajuMcNHhr6Rdn7IW1gPsbHR8KlKY+S
	 6j0h2aMMIcjb80lhUw4XUKfS+jgzvws9OYF9NDnqqptiFVVvTkI9PVYQnxJJ5n/W/5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948804;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ztevti+WsATUuW7wQq520FDwCCOhR3BLi5Ik6z3HcRU=;
	b=Dyp73mPrFrGVuBJYJfQ5O/+IvoCUE3j5QvdVQrlFx2Gwxft35tBNtySu1WpzG+aCgJP+
	 vZgwrvwsFVAbRYSEaKDg/8ofUaJpaO8UwLSmDvVKAzyGCoaFizfmDEyV0euER57mgQtqY
	 EYRumdL3QiHLrr+ZaxbYHYqcWYgWhr0IBaqP4CSNmmYf0L8gxwWM1N511p+pT7sWuFGBM
	 eyG1vQIA+luVG0YlKHMKyQrfTMWGu2T+Vrxwms7u0hf5mjrvm0WKjcDRTgnU/VCfTqjLC
	 JZQuDB0BitAkwt1ykyEXICHDOiByKQEB0Wg9rBxIDmTFOudrsDtZabgpmHCOjFDEw7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kaihong.com;
	spf=pass smtp.mailfrom=kaihong.com;
	arc=none smtp.remote-ip=115.124.28.89
Received: from out28-89.mail.aliyun.com (out28-89.mail.aliyun.com [115.124.28.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D9606A331;
	Fri,  6 Nov 2026 07:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760D9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaihong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaihong.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07380707|-1;BR=01201311R901S77rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00400029-0.000233897-0.995766;FP=107825249825553556|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jy2.92k_1793948790;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.jy2.92k_1793948790 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:06:32 +0800
From: Wang Xiaolei <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bounds access in fsel_get()
Date: Fri,  6 Nov 2026 07:06:26 +0000
Message-Id: <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
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

brcmstb_pinctrl_fsel_get() takes the value read from the pin's FSEL
register and uses it directly as an index into
pc->pin_funcs[pin].funcs[]:

        fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
        func = pc->pin_funcs[pin].funcs[fsel];

That is not how the register field is encoded. The setter,
brcmstb_pinctrl_fsel_set(), treats 0 as GPIO, 1..n_funcs as
funcs[0..n_funcs - 1], rejects n_funcs + 1 and above, and n_funcs is
always BRCMSTB_FSEL_COUNT (8). The field is therefore a 1-based function
number, while funcs[] is a 0-based array of eight entries.

Every readback is consequently shifted by one slot, and a field value of
8 -- which the setter accepts, being the eighth and last alternate
function -- indexes funcs[8], one element past the end of the array.

This is reachable from userspace without supplying any invalid input:

        # echo "gpio45 alt8" > .../pinmux-select
        # cat .../pins

The write is an ordinary mux request that fsel_set() accepts; the read
that follows goes through pinctrl_pins_show() ->
brcmstb_pctl_pin_dbg_show() -> fsel_get() and triggers KASAN on
Raspberry Pi 5:

        BUG: KASAN: global-out-of-bounds in brcmstb_pctl_pin_dbg_show
        Read of size 1 at addr ffffa07c577ab2e8 by task cat/839
        The buggy address belongs to the variable:
         __compound_literal.62+0x8/0x40

A field value of 0 has the same root cause in a milder form: it is
reported as funcs[0] instead of GPIO. The mux itself is programmed
correctly in both cases, so this affects the debugfs readback and KASAN
rather than the hardware configuration.

Handle 0 and out-of-range values explicitly, and index funcs[] with
fsel - 1, so that the getter uses the same numbering as the setter and
the index can no longer go past funcs[n_funcs - 1]. The existing
fallback for func__ placeholder entries is kept:

        if (!fsel)
                return pc->func_gpio;

        if (fsel > pc->pin_funcs[pin].n_funcs) {
                dev_warn(pc->dev,
			 "invalid fsel %d for pin %u\n", fsel, pin);
                return pc->func_gpio;
        }

        func = pc->pin_funcs[pin].funcs[fsel - 1];

Tested on Raspberry Pi 5 with KASAN enabled. Before the fix, writing
"gpio45 alt8" to .../pinmux-select and then reading .../pins triggers
the splat above. After the fix the same sequence reports
"function spi_m" with no warning and no splat, and a register field
value of 0 reports "gpio". The register is restored to 0 afterwards.

Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
Cc: Jonathan Bell <jonathan@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/bcm/pinctrl-brcmstb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
index f46b27155c3c..2b942ca7196b 100644
--- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
+++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
@@ -66,7 +66,16 @@ static unsigned int brcmstb_pinctrl_fsel_get(struct brcmstb_pinctrl *pc,
 
 	val = readl(pc->base + BIT_TO_REG(bit));
 	fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
-	func = pc->pin_funcs[pin].funcs[fsel];
+
+	if (!fsel)
+		return pc->func_gpio;
+
+	if (fsel > pc->pin_funcs[pin].n_funcs) {
+		dev_warn(pc->dev, "invalid fsel %d for pin %u\n", fsel, pin);
+		return pc->func_gpio;
+	}
+
+	func = pc->pin_funcs[pin].funcs[fsel - 1];
 
 	if (func >= pc->func_count)
 		func = fsel;
-- 
2.34.1

