Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198691;
	b=nB8pE0rsS2C3jvSPxCgWf2HUZ7WeNWGjQR6SU0P064jFtJ+71qUJLSXDtuDJ8DadKbYy
	 rU6Jzv3XbuPjg6DqlBEhK2qt7sgXNDR0foF+KzQIGiOLR4uaWGRBzjHKC0KxslnE8McTn
	 aV70AyHzH15eUygoMUq3uYO5B2+7e60Mf7AmkpWZevybkQ0+PltaBq1dneO3USZr4yd8S
	 1AyXgtLyVXUpI8ny8Ey6mG+a12U1oXYdG7GqiffRJUpCE9V4azhxOjL17CG8o2krB831I
	 0mX460/a20b3YWFkE8cW0SCqWa+DyJdU7CmVa6AirC9KBibIG6MGmcACKVvBaxDHaoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
	b=GN0FSuemfATo3E7/zic/L6IP2mW7AeSc483eytlRVsV633EBAXdaeKVnhEphmf3sg5Ia
	 BA2aW0DH7hnuCpPUARfu/o9U0tnDxLt7WCVjBPKzWKN1tGPKEDCbQyMBEZvibRxYtITR/
	 SZ5dAYSpEYg/BOazjGBzpJTpWwATjqcACxK6kDpsfEpoJhCCLq8Xp/TspGPwRbeJjRMH9
	 eksmHHB73vOS92S16ooAFWJoMPsEsSJ6cUQjE+1vb1DD2zWcpsho5YY2ReETFkIbEljvh
	 +vgcABIa+Hcj9PtU5+eS1qPMnopXR7j7mH3M2LKyOdtc3KEKKv/C6m1dM2NQ2bLmPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqtSrXl7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfiPJMo5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F28660A2617
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F28660A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TqtSrXl7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfiPJMo5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdt26137566
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=; b=TqtSrXl7wpab9n6s
	Ck/FEYQRFkKcIrLJbX8LuZIGIdBwh6PwIgljPDs+oEDEgdyhS/IdB7ZbXyoOsyNH
	eoXuYBQF31/jbdqbzhMtgoo4fS4D+mg0PxWLKzCMOvI1a+/Og5IU7gqaZjztoKDJ
	sMCbCyXxGyqN+cqVTZcmqMuJJ8PWPfOIuofspWwvor2h5CbpC0wdOjd9h6eFJBjP
	SbHjxUsS0VJaWThYnEstcH0fsbaOUIi79N4obbIjDhtf1x/yJwqdQiTSX6rd1yH8
	vI80SJSwl2RfSp6x7R/eaUD7zb9XcD58wu6/HhWFGfuKjFa9lskPtKEW7nkwmwlG
	HcXMmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92yfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so154683185a.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198688; x=1793803488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=kfiPJMo5CLiQhQca9qlSfHu/dpiCNYBwZR5/HYIt/3NpkcE7mWj7uk9AbunO3VvylH
         DQPeofMRDck+dRppoYEFVD1qlOh3SgR5e5Vub7MgfLkAhhYrRbe7HvFzQ4bPafGZFNsC
         XIDDDczVo2OQYE3g3X8/rcky45eno6MZpyyHBY/czyMbKp392PI91aDRR9aVDinaCddQ
         6Sf9NpvBcc/XmC+J12y1gKYIMIHHbNvvhpWeVRghgV4kSzoKRi4CtOIrvSVASWgPD5q5
         A4YgqUJ+KX+KQh2Fl3LPuIa0wuv7Yjh4SktzDcNScEoBJrYjmA+nC8J6GY6D+Rmplyjr
         jlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198688; x=1793803488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yzr929GwM2SJa7VYVOmz341tWRyOOoNw+NqHJyg5xWU=;
        b=sMu1k7SKRJOI9NR80eXyySg7uV4vIKsYrJXSl1g9r9RWHSQYlDJmlBIxa6vjRwOrsk
         VnphgKJh7czAlD+dTrlNi0ICiEn29ySK5zY8bo9nK9aIHrt5Y12BSS5S1gth/BKpYcYP
         SBbWOuMbSYnnkii1O5ht0A2lj2RVRYwaXC89Xf9D9uJsJhkXurbo23qIjkoT4apkKqPB
         GHFZln3Er2VDxo3If89d355yppmYvbXtYMbHPFpRra0xzmCR9oR+XrspCpBBmKSm7NKn
         MsGlpwGWkFHqDFn01omJPxR5a37opdoUMDTkBPH+U5vO/TaLG+eLRduHdqxiDXnUvL2Q
         Xz/w==
X-Forwarded-Encrypted: i=1; AKwUvBxa12Togi0ax91sv/VsUmDd/S4Vm/NJV9M+Vn4TdmvnmnOQBGrGf1KasdJr4ULYge7A/0mQ7NKMJ+f+@vger.kernel.org
X-Gm-Message-State: AFq9FYKXYYHt0b47iuQUdew7+XaxUpfzu4wxtI0MCQMZgc5GHoXM7W/o
	Rl795JMiyzyKnfDTWobMFv6Pn7RZ8ENyXnQb5qeewnMfV3WW+4cVmwTo+GfBAx53S9pcvf6d9Xn
	KnHii/gL4heLU3ZmG0sYL0x+lDLwZ3X3n3KnNLGoRZpfX6MyBvAnoTIl4Wc9TTa4A
X-Gm-Gg: AYBFou2+GDX8YPtbnMqe0iuNKBaF3wWQCbhhzzGaGQ9aW2/C6OwsEBXIVhOQGKPFHU1
	oIzwc6hmkl2eSEsJWT9OsmLeiwd1D+c1ZympcgV5BjwGOPn9cj8YJfVn9n4JceKLXSMp/37dKkq
	U2cOEKkwvlRU9J2BWrqjznNCMCB+NYwutw2DlE6DG2mogR5eC7pbmtINKpZN+rnj93BwlxY7iPb
	z3BdTgnlJFpX5t2UPlbPyK6uIu8MEIgDvoNMHkaBJ3E5PTp/vay7alEEJETYbiQlDkdKQ+9WgaY
	jj7Jk194btOCahLypry8DvCVqn+g5dVSpCpFPxfPaNyG/fJJn+sOCIWzSJrzbL+TZSFDenqAzYH
	2UWm3nkrs2iGYQO0kpkmfR1YS0aJtu/OWoMh+FFx/roJF46hJhGjY+QzVp7wNCzrIHjOTxiaubj
	1aHw==
X-Received: by 2002:a05:620a:371e:b0:93f:4f87:4f5e with SMTP id af79cd13be357-94408cc1098mr388509485a.72.1793198688248;
        Wed, 28 Oct 2026 07:44:48 -0700 (PDT)
X-Received: by 2002:a05:620a:371e:b0:93f:4f87:4f5e with SMTP id af79cd13be357-94408cc1098mr388505385a.72.1793198687761;
        Wed, 28 Oct 2026 07:44:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:38 +0100
Subject: [PATCH v7 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-2-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uuM5n1/ji5JC6EPQ7kRmGdBjzEkAbSpadsEf1ipKIMs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpaE925pbnhhlJ0skqxcrsDPeuEoH+pq0AZd
 0zQJSJXq9uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w2l+D/wMErOsNDvZz/KjCU/SIjChU6kFedpOErh9459H3rNq65PFVvi9lL2UhRdpHlPJU2Su/zI
 sWfY7WKinipwaIDaXCp1r34ea4bOV6v60pe/1N50HXAWq6HubMEVw+jcfWSRIsH+hZ6Nf3gaohh
 ZttvHBXzNQcdHUDHyuk4AMNDTc7qvxmE0ERPvyoMxcu57crmj8wgzNGtB9P34mb2juPBdIIixPE
 2hU3xvrk4Nib+oNHsquHvU+L1PrhU0xhfEZSSDzWgOA3/ZElLb83iLtQTT3FBtRMlvQu6DaYwiH
 xU3qJbt6oTWr8TIe0Xfwq8VffzxIy2OTlWuhl7gtsd5zKS/nl8nd1JO6DSpqfipkElAmlrv7vz4
 SqMotMbiJnGDgbsDXJ35QouzA5JG6pbiJk0UkCvDREc1UpXMz4MzoSI9acbSM4reaN5JJGQWEYe
 YXlu+V5JDycnDpADkep3XdoOqsE3kAzjQAgE+Z3eAz40vjvUQTB3vnggBdTF7CTuQpnGOir2KoC
 Si7zhsHZHY74OnvBkfoGEogXFmO2E86066tHF3IV9jtTYbJeVe2ihWtICGwIXN14Oo4q6DrUNgn
 TNaBWeAxOQTWLY3kk2mCumJXJAFIh0i++1LnjxG5b74w2iDZoGJWGxoBTh3GNs0Em7UAO9Yr/7V
 cYkd7jwoztctx+w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae20a61 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX3kH6u5zolFMg
 4mZcd8ii3nIhXVwP9zDh7l+zPrO+B46xrfYFyTUc5+44vYe1Md7GL+4RcbCd7plhqGYV7fhSRxG
 nRvTwoP/1F2qBBxo2vsBJKbC7uJmiaQ=
X-Proofpoint-GUID: 592dwjPAVJ023H213kEf4VaYM_m9jWJW
X-Proofpoint-ORIG-GUID: 592dwjPAVJ023H213kEf4VaYM_m9jWJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXw+TCnLRNVf3l
 7aAIGSyeVcdQYV45OsPqdQSF49ZFrx7HeyAtMJoViAa4+O2CbeEM9CLfGxoGUbegoQpJbIUyTfm
 QDzwz22XmWLDdKNxJC+z42ygwfJtaOXuEfnqUw7w1xQq6Iky2MInLXUa8nBYfqwq2lOITeiDBKe
 VJxaPsvuBb6ZRAuAys5qf0YULtFg0CrPqejYzDjJSaqdiScNTGpopYQJ3LUtdEKWQSG/0fgBEWr
 bvq5YIDhRcObaBhzwKNay+aI1lxWu2Ajai/1YQn3lrCNWfgfJDuK1XPUo1DvMhV8UGEXk4uYR5M
 GT3ELtVOYr6IQmRf/qq/hRuAsVhAziLON6mJrdtPJdBDypmCbUrVwpvI5T+orjYSCIk40dG2kSy
 fM2XLlugdt8EZ+PpAZQZLyZyGo/LUHpao7wkAkNoHAqM4FDMeLw/qzyvtvuIkstcktvn19752/J
 L4DkDxznOB2IWNsGkTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

Move the per-entry part of gpiochip_setup_shared() into
gpio_shared_setup_entry(). This is a preparation for making the setup
all-or-nothing, which requires handling the failure of a single entry
in isolation. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 112 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 64bb450f0a8461d214a45aa97e2474ff0d1857ce..47b434db72f1ebd35ec36ebdb35f30809f4522f2 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -538,12 +538,71 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	}
 }
 
+static int gpio_shared_setup_entry(struct gpio_chip *gc,
+				   struct gpio_shared_entry *entry)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+	struct gpio_shared_ref *ref;
+	struct gpio_desc *desc;
+	int ret;
+
+	scoped_guard(mutex, &entry->lock) {
+#if IS_ENABLED(CONFIG_OF)
+		if (is_of_node(entry->fwnode) && gc->of_xlate) {
+			/*
+			 * This is the earliest that we can tranlate the
+			 * devicetree offset to the chip offset.
+			 */
+			struct of_phandle_args gpiospec = { };
+
+			gpiospec.np = to_of_node(entry->fwnode);
+			gpiospec.args_count = 2;
+			gpiospec.args[0] = entry->offset;
+
+			ret = gc->of_xlate(gc, &gpiospec, NULL);
+			if (ret < 0)
+				return ret;
+
+			entry->offset = ret;
+		}
+#endif /* CONFIG_OF */
+
+		desc = &gdev->descs[entry->offset];
+
+		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+		/*
+		 * Shared GPIOs are not requested via the normal path. Make
+		 * them inaccessible to anyone even before we register the
+		 * chip.
+		 */
+		ret = gpiod_request_commit(desc, "shared");
+		if (ret)
+			return ret;
+
+		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+			 entry->offset, gpio_device_get_label(gdev));
+	}
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
+			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
+			 ref->con_id ?: "(none)");
+
+		ret = gpio_shared_make_adev(gdev, entry, ref);
+		if (ret) {
+			gpiod_free_commit(desc);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	struct gpio_desc *desc;
 	int ret;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
@@ -571,54 +630,9 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
-		scoped_guard(mutex, &entry->lock) {
-#if IS_ENABLED(CONFIG_OF)
-			if (is_of_node(entry->fwnode) && gc->of_xlate) {
-				/*
-				 * This is the earliest that we can tranlate the
-				 * devicetree offset to the chip offset.
-				 */
-				struct of_phandle_args gpiospec = { };
-
-				gpiospec.np = to_of_node(entry->fwnode);
-				gpiospec.args_count = 2;
-				gpiospec.args[0] = entry->offset;
-
-				ret = gc->of_xlate(gc, &gpiospec, NULL);
-				if (ret < 0)
-					return ret;
-
-				entry->offset = ret;
-			}
-#endif /* CONFIG_OF */
-
-			desc = &gdev->descs[entry->offset];
-
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
-			/*
-			 * Shared GPIOs are not requested via the normal path. Make
-			 * them inaccessible to anyone even before we register the
-			 * chip.
-			 */
-			ret = gpiod_request_commit(desc, "shared");
-			if (ret)
-				return ret;
-
-			pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
-				 entry->offset, gpio_device_get_label(gdev));
-		}
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
-				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
-				 ref->con_id ?: "(none)");
-
-			ret = gpio_shared_make_adev(gdev, entry, ref);
-			if (ret) {
-				gpiod_free_commit(desc);
-				return ret;
-			}
-		}
+		ret = gpio_shared_setup_entry(gc, entry);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

-- 
2.47.3

