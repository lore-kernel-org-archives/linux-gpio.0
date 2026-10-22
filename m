Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637011;
	b=EU+YRMBojPBN2wBj5UY8W80J9wMkP5OgPuVoX+YrYsko2Uh/El5Mh7wmYssANRjv0Ec1
	 wHuX8KmMBQmXH+jNhgl8ojsgqwq+KLF/IgFrxSZP5e+CQSh3Uy1sVdS5raQinzWlb9z+m
	 fypwoUpNLDC0f57/WtzygMtlN4nHFyL9Bb3sJegtuW0OUV633S2lpm8g3OQWNN/8Vak2G
	 qugVIGd/mS0ZVTgSRqmPvQnV6BK7B80X/CiPPaf4C65g7H7tDLQZxSN5I1Q+/2RK+IY5m
	 0UyukjqL6xB3OrYkrSgf/1KX+jekFY7ev8aYfLqD3CJ+WFi/Qumhyc8aID3UyVIH1rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TUkEOgHWS4CYXansuqJaAAhK76CRt/42A/p2kv2zT+8=;
	b=lVUUV6VxpBVGWUuNF4v8GshngfF5xiAozca0gWdEfwGVwogcvAwY+0z5yzXv9QHZzKoC
	 Lq9Ab7MaaTY4andPHLUkTkb3AdnTHX2LDsvOm7jwy9JXsCxefwcOUW31C2Lb1fwk7gkd1
	 SI2uUCS6pluEvFaGh2mqzHoqovdVZC79xNIKvTdWpMbxuMRc7TAh7UVHlohGv9UB3c1+T
	 chZFEuUpcO6mXVHyfhNnzoRrNKaT5a8IQVwhKi504WyCAVKfGFTYSoErk2JcvrBw8eJIO
	 e2ZnIHxz6jtaa+Uii6+nBvHf3oxP5EGq8dyXYVRSkeiPEJwVvxoNgUYDgL/199bXAiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vq6uNdex;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D07606A31F
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 02:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D07606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vq6uNdex
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so1948724c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 19:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637011; x=1793241811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUkEOgHWS4CYXansuqJaAAhK76CRt/42A/p2kv2zT+8=;
        b=Vq6uNdexRdZ70TVF/GO94aA1fVQozWvocqjr77Hr1V84QRfUKAkhDXYCwjpgsn2WKX
         GGQNpsSxq8/sc8e8uC/iXziHqoIYYujAlrcsY5ofvgtYerRWJW9Q8EGUAwfugOqvSRTT
         eNdTfENB5V7XdBTTSWJg1LWywEikrI80sxJ6wOvR8wcUCUQxkvnzhVJcLb6kzwqMYnXi
         /pnG+p36zDjYAfcMi1FjtEdmFP+M5afF3yYDJn6XyzhvP/TNNZCPXs0dX3TtaD24cC1R
         0eP9wtj0ZQTGywlTqCLgCX3i0jhooW+XKzHamx+9IvF/RMfEnA0SXrV4wBUhVV+zUYuZ
         BKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637011; x=1793241811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUkEOgHWS4CYXansuqJaAAhK76CRt/42A/p2kv2zT+8=;
        b=AL0D65IoZRcob+mYvfl1Xj4I9m8F4xi0GQZRftc+ro1IaHACu2kZQGg5iAqDHucYRz
         59pEsAES70fgX3Vkg6P0GLHFP4E/Vrpe3H5NlPWiADS3TQgRBomqejIE6NYS/edfqVw4
         bEdXk4OzqWAxH3/MGKgjcqCuMoFxhuVwRcTqr7EmelrNYIV019ZCrrELPQN/QjCNpUnb
         4hqUaWuFtZMVw/uevoXhjihLWOxmV6WeJs248FkGWK9fL8IgPPVYOWvhG7J14MFhwUFb
         RyNWb3FWxjH7km2gs/x1TK76nrG5kCgypaoMZdYZjYCQeBNJ2EgTIgD8IxMLuF/U4+I3
         UAsQ==
X-Gm-Message-State: AFq9FYIdVNLvERb4TRwUgUb5+ZKEmiA9dndFCbIjLc1RCJ648MeNgvaT
	7XIEBQNBsI+Vl8ohXAgxlKONKNnvWBYM+16JHPks3mZ8G7UUfauIvQZnODWl6w==
X-Gm-Gg: AYBFou2T1bijWbxrQ/Tuu6sSxNjM9LKudnkstZSMdiIgDqJjA2x0h8Z308eRQlfeXpW
	jO7501e5gjiPNbq8R+AqqedxZfS5cOdDM/yE1iDVWyzl9/pUBIjX0+vW7OYOv3VxulYvhcg0hMb
	zUMtRNfhm4CDJd1ydg5g4KgaMb8oNoSIWvoSlApSDP28CZzkcntYnwp3WxA0S56YFl0fjZKeGVw
	8z1aD0h4lHrukobMhW4vIzBu4rRWDDTOL8YKSDW7wiGrw/PZD0cgPZ7nlgP/iqwjh/zdXTXJVlE
	qLa6a0gEqM/NHo7WoHhi+vXBiHG8E16SpNxmn5JzurvnmRgtTb7HUviF/YvyCKZFRpG/FqKe6DY
	/OxaG/TPPxYwGbXR4RmqkvwwNEth2tZWaamIbWvDDMDxCo/c5T45utLz/snynlfFl1AG698KyMk
	pEI1IAqrgL+F+0rtKZEt/wizSBd4u4D9Z1YxamJngrwE5HmSgKuki1ndlA/nA2jB2u8N/3NyGnT
	ox/jvcynSO3Zva8mdpo51WfGW/GwuaHE7wvxIM6c1QZX35Tuo1QUtfgaQDAaBYMcICYFGpJ9sWf
	zTriEsnI/aFhUBwbeg==
X-Received: by 2002:a05:7022:7a9:b0:187:eb7f:b8f with SMTP id a92af1059eb24-190a50efe13mr6277201c88.13.1792637010372;
        Wed, 21 Oct 2026 19:43:30 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm11077386c88.17.2026.10.21.19.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:43:29 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	tan.siewert@9elements.com,
	billy_tsai@aspeedtech.com,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [RFC PATCH v2] pinctrl: aspeed: Hand over global GPIOP passthrough to local mux controls
Date: Thu, 22 Oct 2026 08:13:14 +0530
Message-ID: <20261022024314.48623-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
 <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
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

On B650D4U, GPIO-only host power control fails when SCU51C[9]
selects GPIOP passthrough even after the normal GPIO request path
clears the per-pin SCU4BC selections. The THRU expressions currently
model the local controls but not the shared strap source.

Experiment with transferring globally selected GPIOP0-P5 THRU roles
to SCU4BC[29:24] before registering the controller, then clear the
active shared sources. Leave PWM selection and the strap-source
selector unchanged. Subsequent requests use the existing mux helpers.
Clear SCU510[28] through SCU514 and verify the shared enables cleared.

If handover fails, record an instance-local error and reject GPIO and
mux requests involving P0-P5 before changing their mux state, while
attempting to register the controller for unrelated pins. A P0-P5
controller hog can still cause registration to fail. Retain prepared
local selections after partial failure rather than blindly restoring
a shared enable.

This RFC explores probe-time normalization rather than the previous
request callback. Mandatory initialization policy, signal continuity,
concurrent SCU writers and post-handover registration failure remain
open design questions.

On the tested B650D4U, the new image powers on the host with unchanged
GPIO-only power-control userspace. SCU4BC remains 0x30000000 and
SCU51C remains 0x1c80 before and after the request. The operator also
reports successful power-on after complete AC removal. Actual P4/P5
forwarding, transition glitches, PWM coexistence, SCU510[28] hardware
handling and restricted failure paths have not been validated.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 147 ++++++++++++++++++++-
 1 file changed, 143 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index b0c7e4f6df9c..54396f2ba91b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
@@ -40,6 +41,8 @@
 #define SCU4D8		0x4D8 /* Multi-function Pin Control #23 */
 #define SCU500		0x500 /* Hardware Strap 1 */
 #define SCU510		0x510 /* Hardware Strap 2 */
+#define SCU514		0x514 /* Hardware Strap 2 Clear */
+#define SCU51C		0x51c /* Hardware Strap 3 */
 #define SCU610		0x610 /* Disable GPIO Internal Pull-Down #0 */
 #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
 #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
@@ -2747,12 +2750,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pinctrl_data = {
 	.nconfmaps = ARRAY_SIZE(aspeed_g6_pin_config_map),
 };
 
+struct aspeed_g6_probe_data {
+	struct aspeed_pinctrl_data pdata;
+	int thru_error;
+};
+
+static bool aspeed_g6_is_thru_pin(unsigned int pin)
+{
+	return pin >= AB22 && pin <= AB23;
+}
+
+static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
+					 struct pinctrl_gpio_range *range,
+					 unsigned int offset)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+
+	if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
+		return g6->thru_error;
+
+	return aspeed_gpio_request_enable(pctldev, range, offset);
+}
+
+static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
+			     unsigned int function, unsigned int group)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	struct aspeed_g6_probe_data *g6 =
+		container_of(pdata, struct aspeed_g6_probe_data, pdata);
+	const struct aspeed_pin_group *pgroup = &pdata->pinmux.groups[group];
+	unsigned int i;
+
+	/* Check the entire group before the shared helper changes any pin. */
+	if (g6->thru_error) {
+		for (i = 0; i < pgroup->npins; i++) {
+			if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
+				return g6->thru_error;
+		}
+	}
+
+	return aspeed_pinmux_set_mux(pctldev, function, group);
+}
+
 static const struct pinmux_ops aspeed_g6_pinmux_ops = {
 	.get_functions_count = aspeed_pinmux_get_fn_count,
 	.get_function_name = aspeed_pinmux_get_fn_name,
 	.get_function_groups = aspeed_pinmux_get_fn_groups,
-	.set_mux = aspeed_pinmux_set_mux,
-	.gpio_request_enable = aspeed_gpio_request_enable,
+	.set_mux = aspeed_g6_set_mux,
+	.gpio_request_enable = aspeed_g6_gpio_request_enable,
 	.strict = true,
 };
 
@@ -2782,15 +2829,107 @@ static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.confops = &aspeed_g6_conf_ops,
 };
 
+/*
+ * Experimental: transfer the global GPIOP0-P5 THRU selection to the
+ * individual mux controls before registering any pinctrl consumers.
+ * PWM selection is higher priority and is deliberately left unchanged.
+ *
+ * Do not undo the local selections on error: a shared enable may already
+ * have cleared. Keeping the equivalent local selections preserves routing
+ * while rejecting affected requests, rather than granting an unsafe GPIO.
+ * Signal continuity during this transfer still needs hardware validation.
+ * Running before pinctrl registration excludes this controller's consumers,
+ * not independent SCU writers. Regmap locks individual accesses, not this
+ * sequence; coordination with other writers remains an RFC design question.
+ */
+static int aspeed_g6_thru_handover(struct regmap *scu)
+{
+	const u32 local_mask = GENMASK(29, 24);
+	unsigned int strap2, strap3, local;
+	int ret;
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+
+	if (!(strap2 & BIT(28)) &&
+	    ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
+		return 0;
+
+	/* Preserve every globally selected role, including under PWM. */
+	ret = regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU4BC, &local);
+	if (ret)
+		return ret;
+	if ((local & local_mask) != local_mask)
+		return -EPERM;
+
+	/* Leave the inactive GPIOZ6 source alone in dedicated-strap mode. */
+	if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
+		ret = regmap_update_bits(scu, SCU51C, BIT(9), 0);
+		if (ret)
+			return ret;
+	}
+
+	if (strap2 & BIT(28)) {
+		/* SCU510 is write-one-set; do not use an ordinary RW clear. */
+		ret = regmap_write(scu, SCU514, BIT(28));
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_read(scu, SCU510, &strap2);
+	if (ret)
+		return ret;
+	ret = regmap_read(scu, SCU51C, &strap3);
+	if (ret)
+		return ret;
+	if ((strap2 & BIT(28)) ||
+	    (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
+		return -EPERM;
+
+	return 0;
+}
+
 static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
 {
-	int i;
+	struct aspeed_g6_probe_data *g6;
+	struct regmap *scu;
+	int i, ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+	scu = syscon_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(scu))
+		return dev_err_probe(&pdev->dev, PTR_ERR(scu),
+				     "No SCU regmap for THRU handover\n");
+
+	g6 = devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
+	if (!g6)
+		return -ENOMEM;
+	/* Copy per-device state; referenced mapping tables remain shared. */
+	memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
+
+	ret = aspeed_g6_thru_handover(scu);
+	if (ret == -EPROBE_DEFER)
+		return ret;
+	if (ret) {
+		g6->thru_error = ret;
+		dev_warn(&pdev->dev,
+			 "THRU handover failed (%d); GPIOP0-P5 mux requests blocked\n",
+			 ret);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_g6_pins); i++)
 		aspeed_g6_pins[i].number = i;
 
 	return aspeed_pinctrl_probe(pdev, &aspeed_g6_pinctrl_desc,
-			&aspeed_g6_pinctrl_data);
+			&g6->pdata);
 }
 
 static const struct of_device_id aspeed_g6_pinctrl_of_match[] = {
-- 
2.47.3

