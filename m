Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A694C54705F
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 01:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471038; cv=none; b=nLtJbbmsY6UW1OL+M99CXJgHsOSxwJCMbgt1Duy5DXsxCyG3hJYFlEEyABOGiG+vVd3QvaaPYorsWvpaWmnAC6gIUE+2zz76KAtEAZu4XNedHrjv6Tub1zYAFh0Ukg+YjCU8vqDPuqZ4LnNYSCozxb1jYAHlQngUlqRaaZZZSlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471038; c=relaxed/simple;
	bh=marhlNipNbMxI0CgItd+Pi+fWx7oIWXPz9lfA+qzFG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuPQekOUIpMZZnBsnl4RLu+jyhP3Q3UJGo6KUokhyeJHusDlcxgi0qT1ubgmfBMgK2cYshbuIVVengiODtuwXuAioZrkT08IF7KrENFhLoZuymD06e0TbJQKgsNm8VMXKzQep8ghFex/PDpMP0Q+bkpYSc55mOeBd/jR17uf1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jaZW3NE3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+r3TGea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jaZW3NE3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+r3TGea"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QHG4Mn508698
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 01:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkJnuUvBBH41ew5VjxCDAwhZ8UYDA/JF5rRhoojlH2g=; b=jaZW3NE3jvYDCx0q
	VBU9algM7+7txHj2jH7SSHP6v7tgLLgJWSfpTJd4kKv3uvCveP8I5fBULR6X0NjN
	KzExL2RI6amQRkECCZusA5gJ4Ox6S2V9UrON31pE3gK+kcW0wnAsIPBjTH5lu4Il
	qmj//lKYr8Fc4WG2DaKj7VKMSxp4h7d8oB2GnxzpRA8MMcVauTawXKOAHVA8sPop
	mLvx+/UdXqlIl7gkBb22k0iYmCkNt2vR0kmc4nXnvcRwiZRzUq1efZHfTtoM0qLC
	UW9tvhGR0m/8zAASe1VTNH4gJiyYjwGQlrUe0eRAKv/MKmduqn0vHebp/mbrm635
	Luu63g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx693a2ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 27 Sep 2026 01:03:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-333543ac378so2567207eec.1
        for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 18:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790471035; x=1791075835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkJnuUvBBH41ew5VjxCDAwhZ8UYDA/JF5rRhoojlH2g=;
        b=U+r3TGeaeqSQkrAGz4ZrIGVCNnwZVMeo48glUrHkK6PxLnzwcGE+31FkbY5KHuD0he
         ZUU11L1UCtcqSBf6wwJ5zf7aI4QBeCrEHjzhzHMtsM171muqcNM77fviJ7FMaH0aRsA/
         Ml6/gorJAbWWilXJXTW+obelTby2y4dTHTJfdV5vipzkxjLFmb0Kao2HvwHA3gtvDFCj
         HR8GwG3tZ3khNjNQASFgKNgiisCbMAIUgYQ8F2tJ9mEbOsYMYtMOXrzzwquAg3JGrmof
         lJ8mbwEchYRGXW6R52vsCi3PJDwPjcPwFUFf+tBTUV+3Lf51OjEwgnOJEtVe7W7fU42/
         QfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471035; x=1791075835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mkJnuUvBBH41ew5VjxCDAwhZ8UYDA/JF5rRhoojlH2g=;
        b=SZiu4ZNpU6BPi5jxYNHoI9IQoIb+dP4INvdF3kYiNltyyPRzBCjKQtNRqHpB0hAWqM
         E5e7XLyaBYOPoVRlMbZ7NFqG3Sy6m/oim0WzXHNYNAfNEZbHFqlpw3Zc9H8I8hwKi1aW
         HRDZFzILJFF2CpSx+hiVWu7RmtMRu8CFL3KYiGwnZ/MlNDcmglAIhci2PAJphSNyS7L3
         w4V7cJEcoaLa/+bmhX31K13k/5Py6f5t2RhJrXVw6WuoyEBtZvJl1oKoLavCpc5D9c24
         /oK9SywbXBKfOlx3t0vSteISM2lG+xpXUt0hGQBKcTPdjumee/Nqu0VBa9BRX0Y5vlvr
         uPdw==
X-Forwarded-Encrypted: i=1; AKwUvBzOK3DEaCW40z2hpprGM05SgkgYcWYqvMZhcPCSsBIM2DoiMYdX6kb0iYFoEv4MBjKy1eNtL0c9uS4J@vger.kernel.org
X-Gm-Message-State: AFq9FYIjTZnEI5UPK3oGdrzsBHKjLm6rV+CqRPWoHgK9Q/Jmyqp2rGII
	LQQphXtMYBSr9awAUQ4dDUg9nmlzR+v+zg3vVpPVqwXccOAq11bH87W2FN7t7IEjkzt3kJlSzyi
	+i5eLr5HWfwrueO6r/lWR9L401OAFfaWGofUKVFB3UiHjtTMlZ6fxCRoo4+a7yC2Y
X-Gm-Gg: AYBFou24Pb4P+ZbJVDKbE5W/zpfBVYDdCNFuD8iRCUm8/MJCZhmzQ/faWW06BYCi/77
	I23bTw/onjje0KGiiPbrSh3H4nuuOFZ+m/ZITZmvg8CVqUMqugP9nOh5/dNK5Hd3PkoG2wql61K
	1ZvKvsBvRG2VjYMAulye2aKZU49ywUFABoK5wWObUMJB7hCLtxhHtSxRdYX4+/Q/7Rn1opkBdzm
	bPnYn276EEskZWPjEzFkE7Hw6Hety9jTrqd9q6KUGeteXb0KaGpx5hteINrN2XSZujkbYt5sIev
	rmkZVZb2qDalJXrcpjn9L0YdPLz3s0EJs9nrnkfbonHoxKlRe40l7cYd6qzl9IwRBaEZKvSkSle
	I38cWNrmuY2+F2kxh2et5cgdqsygFai3hNQ6qhw4vSA==
X-Received: by 2002:a05:7300:aca2:b0:342:2e4e:7890 with SMTP id 5a478bee46e88-3427334af32mr5827951eec.36.1790471035084;
        Sat, 26 Sep 2026 18:03:55 -0700 (PDT)
X-Received: by 2002:a05:7300:aca2:b0:342:2e4e:7890 with SMTP id 5a478bee46e88-3427334af32mr5827915eec.36.1790471034462;
        Sat, 26 Sep 2026 18:03:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm27974387eec.9.2026.09.26.18.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:03:54 -0700 (PDT)
Date: Sun, 27 Sep 2026 09:03:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arhrdSHreagHA-dc@QCOM-aGQu4IUr3Y>
References: <20260924070323.983528-1-shengchao.guo@oss.qualcomm.com>
 <CAD++jLkj-9=2sduOOJDA6bTN=HWVNeHwKcN1N6YvYNg4YNT6Cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkj-9=2sduOOJDA6bTN=HWVNeHwKcN1N6YvYNg4YNT6Cg@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAwMyBTYWx0ZWRfXzWnbYqYKFlrc
 JI/VEV3l0TQ70YyxiHrXc5JdmGcF0yRkJnAOi0UdJFMHJkXqKXZmv7hRw8p5c42tAxATHvXZwy+
 jjipaJiZweZsSx0MKpI1DEAdYqxsHMM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAwMyBTYWx0ZWRfXyV7liQ5ZSJCV
 yIwAwXdGbNrwIeqRsFTmDxLsINz/C5wqoAeajhUVe/QEPNisEJU8ksvvRmpcE6VqYBhTvsp+XEq
 xAhAV88gNk5bVjLREUy2JCAkwGMTe9Quuu/EqvMhzP3UUreFIOou4hjJqtuz1be8PYBUPCq2ppZ
 BkhPGerUD5VoWFDwIiV9/XLaDWjRYrTWVkeEq+qzYPtOvtgIcDhk4fPcNddsvBXCggHzLnw+Zv5
 ZALFJmS4TqGaDYA613C1aQ/H4OKRbF/F/CJYmwqhwDPwVyvxOIdMCh51DYYn5ZhtkPlzwEEyXvy
 46VnKvP3S/Cs5Vecdv4ggk0qCBDpVzjBw5uFotQSMsFMTN84Ax5SGmI+HkpTyRQ5dFh5jRfhhhP
 pVADwLQYTIOsKhrupne9fpPoBEFda5rcDZVRx0DqbVTSz5R4ADfu3/YhUKZWPT4dlvfi/wTwbIe
 iEaLywmhxFwb1IJn18Q==
X-Proofpoint-GUID: AJ6TtT_c92PD6AcxUVmyAtJpx5u_vKj0
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6ab86b7b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=z4sq5ar2yq4UgXueNjYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: AJ6TtT_c92PD6AcxUVmyAtJpx5u_vKj0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270003

On Sun, Sep 27, 2026 at 12:35:13AM +0200, Linus Walleij wrote:
> Hi Shawn,
> 
> thanks for your patch!
> 
> On Thu, Sep 24, 2026 at 9:03 AM Shawn Guo
> <shengchao.guo@oss.qualcomm.com> wrote:
> 
> > pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
> > the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
> > DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
> > buffer enabled.  Neither direction callback clears the opposite buffer:
> > .direction_output() only packs PIN_CONFIG_LEVEL, which sets
> > output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
> > which sets input_enabled.  Requesting either direction on such a pad
> > therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
> > direction.
> >
> > That silently breaks both directions.  After gpiod_direction_input() the
> > pad keeps driving the line.  And after gpiod_direction_output()
> > pmic_gpio_get_direction() still reports GPIO_LINE_DIRECTION_IN, because it
> > cannot tell plain input from input+output, which makes gpiolib consider
> > the line an input while the driver is driving it.  On a board where
> > several regulator-fixed nodes share one PMIC GPIO the shared GPIO proxy
> > reads that direction back and rejects every consumer after the first:
> >
> >   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
> >   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
> >
> > Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
> > direction so that the resulting MODE_CTL is DIGITAL_INPUT or
> > DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
> > once after walking all configs, so this stays a single register write.
> >
> > Open-drain and open-source outputs are the exception: such a pad only ever
> > drives one rail, so DIGITAL_INPUT_OUTPUT is physically correct for it, and
> > pmic_gpio_get() needs the input buffer to sample the line rather than
> > return the value last written.  So .direction_output() programs the input
> > buffer from pad->buffer_type in either case, rather than only clearing it
> > for a CMOS pad: the buffer may have been left off by the bootloader or by
> > an earlier direction change made with a different buffer type, and an
> > open-drain pad that keeps it off would fall back to reporting the value
> > last written.  gpiolib applies PIN_CONFIG_DRIVE_OPEN_DRAIN before calling
> > .direction_output(), so pad->buffer_type is up to date there.  Key
> > pmic_gpio_get_direction() off output_enabled so that these pads still read
> > back as outputs.
> >
> > An input must not drive the line whatever the buffer type, so
> > .direction_input() clears output_enabled unconditionally.
> >
> > Pads that are genuinely bidirectional can still be described that way
> > through pinconf, which is the interface that has always been able to
> > express it; the gpiolib direction callbacks now mean what gpiolib says
> > they mean.
> >
> > Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> It's a bit in the style of LLM:s to write overly verbose commit
> logs, can you put this into your AGENTS.md file:
> 
> - Use terse commit messages.

Ah, nice tip! I will update the commit log.

> 
> >  static int pmic_gpio_direction_output(struct gpio_chip *chip,
> >                                       unsigned pin, int val)
> >  {
> >         struct pmic_gpio_state *state = gpiochip_get_data(chip);
> > -       unsigned long config;
> > +       struct pmic_gpio_pad *pad = state->ctrl->desc->pins[pin].drv_data;
> > +       unsigned long configs[2];
> >
> > -       config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
> > +       /*
> > +        * An open-drain or open-source pad only ever drives one rail, so the
> > +        * line can still be sampled while the pad is an output.  Keep the input
> > +        * buffer enabled for those, so that pmic_gpio_get() reports what is on
> > +        * the wire rather than the value last written, and disable it for a
> > +        * CMOS pad, so that the pad ends up in DIGITAL_OUTPUT rather than
> > +        * DIGITAL_INPUT_OUTPUT.  Program it either way, as the buffer may have
> > +        * been left in the opposite state by the bootloader or by an earlier
> > +        * direction change with a different buffer type.  gpiolib applies
> > +        * PIN_CONFIG_DRIVE_OPEN_DRAIN before calling this, so buffer_type is
> > +        * already up to date here.
> > +        */
> > +       configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE,
> > +                                            pad->buffer_type != PMIC_GPIO_OUT_BUF_CMOS);
> > +       configs[1] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
> 
> It is also typical for LLMs to insert verbose comments like that.
> 
> BUT! I like the comment, so it can stay!
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks Linus!

Shawn
