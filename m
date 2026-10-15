Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271252CCFF
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074234; cv=none; b=Vpt6lH+q6L6lgyuUMdXCtuu9nh0n/WeUdZl0SckUj/Mtz+9jxMZRvfHggoWkoHlBI1adbTGvnLcQFlyOtvlJTDe0vhA1VlB34MJiDtJ3ZXncwsou96iZaBtjGWI457FiCcr7UWRb0h6F2ULK68t6NMJ/RIl6yge40xMo0DEu/PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074234; c=relaxed/simple;
	bh=FNgqAuAODmWGHZWIRSs8C/bMHDsGbP6GnOBhsQcl0DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AvxmIvXUlCHxxSeY5T0phINIt3erbbV01o4oxeQ3lKux9oxBntdBUKO/Bnp07VYUEFAET5fNlzW3+6QwRX3JeVwEklmjRPFPVomJUkuo7OK2OAlUUuC1VdiiZjmGcvOl50UOdhcQAEG0ld04ecJV2o002oNAkULq753ULPGBJdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=on6qMrcQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEgnBSiY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="on6qMrcQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEgnBSiY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOql2114176
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XpzQJs5SpzZhj6NA78HHgEuNNUorM5ICZZwVwOEt83g=; b=on6qMrcQ7ky332sX
	EGC9jMmByVk9wjtBXB8NKtCmBvWI6iTVCpL4UundtLF3Pfuk9nrLqCs7uCHAHr9A
	T57cXb8Ax9EZ4YFFHqbh/xo5CBsHQYsRB3KGKp0eiYSRXJCLugwlH1z87eNU/az4
	AxcFzzbhCv1QVJO+6IxBkgorml+Nu9XJO0+Lafl1kdOMETsCjGgQwHETIRcW0K6i
	QG+r5tYnGP8v9N3InCAgqNqgx0XQ+evR8KZBVdq0x/dRmLi0nxdcLkZsnKVoM7xy
	F7iXTrHAgj5FmHNt62Rz7sLoT1Kr8DV+n0PntVRN/y2vkN8yIond/0IPrczZ5BeU
	xUB7Ig==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmybgdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 14:23:52 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-17188d538c7so9611075c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074232; x=1792679032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpzQJs5SpzZhj6NA78HHgEuNNUorM5ICZZwVwOEt83g=;
        b=CEgnBSiY7JTUmTKTTGZGfnvjyN7f3gft1Wt3IReSC0msmETVabwVcE9YvugLz51huc
         x/JJ5GSRJobfe3GFUsiqsGfz8f/TAuQxk391MZK9t1ZDxE/n8TSJBfoRMJMhwuSRiEdu
         1IJwD3uLtWAw70C1k6Y3gZRUDpXZubkxJ4pJ+egA4vDdOc9sAPFRbiDiIUsZ+XdEkgL2
         38VYSNN6CADicUeQK6wiFmJ11YolovPjPjcMWSmRoaDsu3sQ+19cqe9PS/6mmj9aq+jC
         Utc/qOu5fWySEG76avbvtTrizcyvuECh0XuzBjUS2TmFiCkgX8mzvQV6ZLTt4V5gi+Vx
         bfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074232; x=1792679032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpzQJs5SpzZhj6NA78HHgEuNNUorM5ICZZwVwOEt83g=;
        b=Q31UX6URnnnZUARxpUhjG0nwIE0cINQUfNbVvQtQhAexiS0hOGutVKV7Fa9ngOJhwP
         Ck971F5aUK/hwCrhprY6JGHdWaP/FPE9TUE3HaiVuYsSE0XoLuAemX7g7bKH0bI/8lTH
         Jfy8FBRH/fOE0UKzFeHceLmIUvV7rA3Ty1/QsFTmbpOggrTKmqoaE2bsb7vwJl1eVN2b
         dDa48TJl1wMHo7DoXKPXolvEycPpwiMVE8hQQGwQH3okCezB1YGAkz0DVvg+m9UJ2999
         lkk1knV9LP7Id56aYoyCAurY94k1h3HJL/7foSaubXWM8M2My9pavD+l442IoPNllRWM
         ksAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3T/YAT0Kwddo+1pxaS8fs2JpJ45h6azn2LtiRC+8uUFinyM6/kXu7rdfHbBHV9X3cqJS0lTIV05uL@vger.kernel.org
X-Gm-Message-State: AFq9FYLiRVGi1TqgsvAw2lAKTp34FJaz88nzElLvKzyN6LfLNcXX0NU9
	KDskuGsotcT/E5CXg6pOvQEs7COJteNPXb3IBTdgKm8dV4EepOyUkgPCFfxSBuaTxECwIUUnc6Y
	Ic/j7hXkSk+3dBqC5twPptYBoX9CyAYBwfDOJcnBYZvR4NxUFfOd7xNOpBl02IOIQ
X-Gm-Gg: AYBFou1yGWFV66kXKavrd3/vW0tFvgn3MarlpqpQCaB7r4kwM88f4MZIxtHYKki3efG
	oQnqOKx8kHDjEmvjzOe4z0iNLu+9axCHzDUHC1BS/kah66gAYr+6BZJfA9PWx9iWynf7/BqSAIC
	u4sYLK6rrZEfPEy6+JFybyzYD9yaj4rcixEF5/fR5euaGITl1YycuvePrbxKrMhsW7L6RzpMQoS
	Fxofd5IvN+OYuD5aT8oHwuRRDR5KOY7kugSVpAIZOOYWn7gdUjLcGTgu4LV8dSH1/uYNQnghQt6
	ksHtwjcAAZCoCp6JqZzGdKT/F46Sn5DYurQ5dlRPICM10A5Ehdn/pIJ182DBDSsiKXau+ild5G5
	CMy8JOpoSM9yDHuoL7TdtXg9Y0W9mRPn3Kho=
X-Received: by 2002:a05:7022:1702:b0:13f:b41f:bda with SMTP id a92af1059eb24-16a5c5f4414mr24506636c88.16.1792074231607;
        Thu, 15 Oct 2026 07:23:51 -0700 (PDT)
X-Received: by 2002:a05:7022:1702:b0:13f:b41f:bda with SMTP id a92af1059eb24-16a5c5f4414mr24506585c88.16.1792074230783;
        Thu, 15 Oct 2026 07:23:50 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm22921139c88.6.2026.10.15.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:23:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:53:00 +0530
Subject: [PATCH v1 2/2] pinctrl: qcom: Allow arming the wakeup_enable bit
 from pin config
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tlmm_wakeup_gpio_support-v1-2-c6d6f37a7e51@oss.qualcomm.com>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
In-Reply-To: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792074202; l=6907;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=FNgqAuAODmWGHZWIRSs8C/bMHDsGbP6GnOBhsQcl0DU=;
 b=bhnxtJ9RC27eopvvFUsWEXvtp7okQ/eyIpy4PRTmeo7rxM4z3mUH3te+EAZ+qQ6b9NZY5+eWO
 5QBWGhfKYN8CGJ9/tTDxkRMSSYMZ21rweqfwqg1HJVTcash97SHrPDH
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: nUBpmH7S35pZGTfdmkT9co9qbwcKMIw5
X-Proofpoint-ORIG-GUID: nUBpmH7S35pZGTfdmkT9co9qbwcKMIw5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXzOhugwlePozJ
 nsfPXXAsk+mObkEWF+A1ACdmfygBUftotqeZrqd1QHrNrpIwd9bPcyyeYbdY2eUaTX3vJkYv3gA
 Z4HWM+clmGq5JkjktSjVUAYIfhb+MwY=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0e1f8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FlIvIJjhoV0WH2cWnOIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX44tzeMfWi5/i
 dUkjS2krF4+4UPfBq15WllHTiynEFXpv/sAzShScdjqKCNHHAb9+XB9QALSEfahDm9AkQYw1iPo
 k2UDD3pEHr6BbNSyBHU5hXPbYHxGpyThgMa4UtEMjyhY+7wwjbNUrOUu7J0JLoA6zW6rzk12NTi
 9kFvccld6TCQPcUUl2s5wZaXG7gsYrqcCHOFtcF7YbsK2Mg7dB/Bl7cTyxWtxIn7J4z/k1lklIo
 gq59MVhOE/zTxIntDpGGHxlBMYVHiDM+Hygh56oVkmrwezvBbbhLZMY/wbt1/dM8zYPH6nqCL9T
 97SQOXIwf39jg8m7PDp1C608piywI+5a1zpcZcAEKvopyYkQ2g6Ji5jAwiJfRr5wb1bQFYalww/
 AgUAmK7mN9+fJATiVvG9bf7KG9l0X4B20+paklY1Lrg7wHtPxas3KdOXlrbITvBimaUV0WPtMrT
 yikpgLnavQxnjkON1Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

A pin's wakeup_enable bit controls whether a toggle of the pad is
transferred to the PDC/MPM HW, which is what both wakes the system from a
low power mode and, as the existing comment in msm_gpio_irq_reqres() notes,
delivers the interrupt event. The driver sets it when a pin is requested as
a GPIO interrupt and clears it when that interrupt is released.

That is the only way the bit can be armed today, and it is not usable for
every pin that needs it, because msm_gpio_irq_reqres() calls
msm_pinmux_request_gpio() and so takes over the pin mux.

A pin that must keep a peripheral function and is still toggled by an
external device to request a wake up therefore has no way to get the bit
armed. On boards with a SoundWire codec this loses interrupts: while the
bus is clock stopped the codec asks to be read out by toggling the
SoundWire data line, which stays muxed to the SoundWire function. With the
pad not armed the toggle is dropped, the controller is not resumed, and the
codec's interrupt - a headset insertion, for example - is only seen if
something else wakes the bus first.

Add a "wakeup-enable" pin configuration parameter so the bit can be armed
from the pin's own configuration, and fold the existing open coded accesses
in msm_gpio_irq_reqres() and msm_gpio_irq_relres() into the helper it
shares. Pins the SoC does not describe as wakeup capable are rejected
rather than silently ignored.

Assisted-by: Claude Opus 5
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 101 +++++++++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 27f06bbc1..cb12f8b90 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -286,6 +286,54 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.strict			= true,
 };
 
+/*
+ * "wakeup-enable" arms the wakeup_enable bit of a pin from its pin
+ * configuration. The driver already does this for pins requested as GPIO
+ * interrupts, but that path takes over the pin mux. A pin that has to stay
+ * muxed to a peripheral function and is toggled by an external device to
+ * request a wake up needs the bit armed without being turned into a GPIO.
+ */
+#define MSM_PINCONF_WAKEUP_ENABLE	(PIN_CONFIG_END + 1)
+
+static const struct pinconf_generic_params msm_gpio_bindings[] = {
+	{ "wakeup-enable", MSM_PINCONF_WAKEUP_ENABLE, 1 },
+};
+
+/*
+ * Set or clear the wakeup_enable bit of @g, which allows a pad event to be
+ * transferred to the PDC/MPM HW. While the name implies only the wakeup event,
+ * it's also required for the interrupt event.
+ *
+ * Returns -EOPNOTSUPP if the SoC does not describe the bit or the pin is not
+ * marked as wakeup capable.
+ */
+static int msm_pin_set_wakeup_enable(struct msm_pinctrl *pctrl,
+				     const struct msm_pingroup *g, bool enable)
+{
+	unsigned long flags;
+	int ret = -EOPNOTSUPP;
+	u32 intr_cfg;
+
+	if (!g->intr_wakeup_present_bit)
+		return ret;
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+
+	intr_cfg = msm_readl_intr_cfg(pctrl, g);
+	if (intr_cfg & BIT(g->intr_wakeup_present_bit)) {
+		if (enable)
+			intr_cfg |= BIT(g->intr_wakeup_enable_bit);
+		else
+			intr_cfg &= ~BIT(g->intr_wakeup_enable_bit);
+		msm_writel_intr_cfg(intr_cfg, pctrl, g);
+		ret = 0;
+	}
+
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return ret;
+}
+
 static int msm_config_reg(struct msm_pinctrl *pctrl,
 			  const struct msm_pingroup *g,
 			  unsigned param,
@@ -354,6 +402,16 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 
 	g = &pctrl->soc->groups[group];
 
+	if (param == MSM_PINCONF_WAKEUP_ENABLE) {
+		if (!g->intr_wakeup_present_bit)
+			return -EOPNOTSUPP;
+
+		arg = msm_readl_intr_cfg(pctrl, g) & BIT(g->intr_wakeup_enable_bit);
+		*config = pinconf_to_config_packed(param, !!arg);
+
+		return 0;
+	}
+
 	ret = msm_config_reg(pctrl, g, param, &mask, &bit);
 	if (ret < 0)
 		return ret;
@@ -443,6 +501,17 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
 
+		if (param == MSM_PINCONF_WAKEUP_ENABLE) {
+			ret = msm_pin_set_wakeup_enable(pctrl, g, arg);
+			if (ret < 0) {
+				dev_err(pctrl->dev, "pin %u is not wakeup capable\n",
+					group);
+				return ret;
+			}
+
+			continue;
+		}
+
 		ret = msm_config_reg(pctrl, g, param, &mask, &bit);
 		if (ret < 0)
 			return ret;
@@ -1221,7 +1290,6 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
-	unsigned long flags;
 	int ret;
 
 	if (!try_module_get(gc->owner))
@@ -1255,19 +1323,7 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
 	 * While the name implies only the wakeup event, it's also required for
 	 * the interrupt event.
 	 */
-	if (g->intr_wakeup_present_bit) {
-		u32 intr_cfg;
-
-		raw_spin_lock_irqsave(&pctrl->lock, flags);
-
-		intr_cfg = msm_readl_intr_cfg(pctrl, g);
-		if (intr_cfg & BIT(g->intr_wakeup_present_bit)) {
-			intr_cfg |= BIT(g->intr_wakeup_enable_bit);
-			msm_writel_intr_cfg(intr_cfg, pctrl, g);
-		}
-
-		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-	}
+	msm_pin_set_wakeup_enable(pctrl, g, true);
 
 	return 0;
 out:
@@ -1280,22 +1336,9 @@ static void msm_gpio_irq_relres(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
-	unsigned long flags;
 
 	/* Disable the wakeup_enable bit if it has been set in msm_gpio_irq_reqres() */
-	if (g->intr_wakeup_present_bit) {
-		u32 intr_cfg;
-
-		raw_spin_lock_irqsave(&pctrl->lock, flags);
-
-		intr_cfg = msm_readl_intr_cfg(pctrl, g);
-		if (intr_cfg & BIT(g->intr_wakeup_present_bit)) {
-			intr_cfg &= ~BIT(g->intr_wakeup_enable_bit);
-			msm_writel_intr_cfg(intr_cfg, pctrl, g);
-		}
-
-		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-	}
+	msm_pin_set_wakeup_enable(pctrl, g, false);
 
 	gpiochip_unlock_as_irq(gc, d->hwirq);
 	module_put(gc->owner);
@@ -1639,6 +1682,8 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	pctrl->desc.name = dev_name(&pdev->dev);
 	pctrl->desc.pins = pctrl->soc->pins;
 	pctrl->desc.npins = pctrl->soc->npins;
+	pctrl->desc.num_custom_params = ARRAY_SIZE(msm_gpio_bindings);
+	pctrl->desc.custom_params = msm_gpio_bindings;
 
 	ret = devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
 					     pctrl, &pctrl->pctrl);

-- 
2.34.1

