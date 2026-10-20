Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498578;
	b=A4+zrhJNBh4cW9JdXWvlyvnOVz8Xa5R2QuakoXATBw2z7x+aNm3iUGek9hpDkvvYGIO7
	 wm8UlwLuJtFgO5ZiuI0GADpgLgNRQi5ocwKe9gi7Tb85oK/0IvKBmTjzXrzfyw3yZoaJR
	 u+U5CEtUBYIGo+w8zgktHXhwEcadU9A/6Epq/kwk0fan6Mqf1twyT9OcYUcC36MLWB4sn
	 kWihPIKUg5yXgMCYxKctmRDHNc+fN6tNyM/1dhgUWSo5j8Hla6kkJrfV6OYgZlV6JVmwy
	 Sv437/X/d9o/hOkzj6G9KGL6c/0YCsnTX7PR7EtTjV++UthqXID0EiW6uyeD2cXoixg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498578;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=T9g7xXiCI18BQG9sRcomFJ6RBZNK5m4Rn8sJrsoOEEk=;
	b=Yw47b5+30YWm+0Pfwonk2QixrKQYgyXtWEvnfG/T6iIweaLMT0JTBA1y/5WAieoMs3gj
	 n6ji0oauL7KIu8gZCJTyEyYieJ/GxKzjo8XTvpW4vLUyE5dnm3oNiDL1H3KjYaLmD1Jdb
	 H12yec+37QDRRd0bCG4g9oYV/mrN8Ic7XAyr6ZeBIR7yu1mw8tJGXRYwcnl4UWFyKqGZ1
	 SPaktt/zeQ8+DQLd5GfnKo/VB7yB9km4hmOFPkcfrn3EKU7uYNPcYzyuxItEmVV/trdu3
	 SCyagIqR5KKkGuPPca3NwFMkbKTq3BonnFjtY5JI2dSRAaM6muKdYk+jYOXBsGqKVgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=idJJA47T;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4A3606A31A;
	Tue, 20 Oct 2026 12:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB4A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=idJJA47T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792498575; x=1792757775;
	bh=T9g7xXiCI18BQG9sRcomFJ6RBZNK5m4Rn8sJrsoOEEk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=idJJA47TjeI1S9DmczXSRiU2Gp5ex5wivwo3P8mPY7P9rvyZ9/E75HU7iQ3lq7N3w
	 77K9MQgreyLK0ZVxJznxUACii2ccthrvB0/7CoAB6RjQnvO9qi85SIrDCcUBG/xRR5
	 5bvGutXRhERJcT8zqwLmfQe6uW5oRiNvVNrmeAxeXntPztowgovXB34t4aBFbWfVbR
	 ftcvY8AyRiRkcLFqWwdbVH15aYJFpUpVjBch1Q0FjB2vT3cDD/JUkWrnzNvtAkvPt/
	 CUd3hQ95SIz5jghsB+Yoo+OBONMP3zAJ02lzjnT56YE9m8O+Y/2QIj+EdI1sJv52RZ
	 Tpt9FKOgmZIbw==
Date: Tue, 20 Oct 2026 12:16:09 +0000
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: x1e80100: lid GPIO wakes the system on every CXPC exit in suspend
Message-ID: <179249856801.47858.11195411660636360454@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 7d5f8ca5a677213c5fb6f022b8dcb5382d6e99e9
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Maulik,

On a Lenovo Yoga Slim 7x (X1E80100) the lid switch wakes the system
from suspend shortly after the SoC enters CX power collapse, but only
while the lid is open. The lid is gpio-keys on TLMM GPIO 92 (PDC pin
138, IRQ_TYPE_EDGE_BOTH, wakeup-event-action =3D EV_ACT_DEASSERTED), and
the PDC is in pass-through mode ("PDC pass-through mode selected
through SCM").

The kernel is Omarchy's linux-omarchy 7.2.8 with your PDC series and
"arm64: dts: qcom: x1e80100: Add deepest idle state" backported from
7.3, plus Akhil P Oommen's "drm/msm: Attach a driver to the GMU" (RFT)
and the 7.3 change that lets the PCIe root ports into D3. Together
they let the SoC reach CXPC and DDR self-refresh in suspend, which it
doesn't on plain 7.2.

With the lid open the system resumes by itself every time the SoC
leaves CXPC. On AC power the SoC leaves it about every 15 s, on
battery the first exit came after about 5 minutes. pm_wakeup_irq is
the gpio_keys IRQ, GPIO 92 reads high before and after, and logind
sees no lid change. The qcom_stats numbers, converted from 19.2 MHz
ticks, are in the table.

  run                             cxsd entries  in CXPC  woke after
  lid open, AC                    1             14.3 s   16 s, lid IRQ
  lid open, AC                    1             14.2 s   18 s, lid IRQ
  lid open, AC, gpio-keys wakeup  48            717 s    727 s, key
    disabled in sysfs
  lid closed, AC                  69            1025 s   1037 s, lid
                                                         opened

So the SoC leaves and re-enters CXPC about every 15 s on AC, and each
exit puts one edge on GPIO 92 while the line is high. With the lid
closed (line low) nothing fires, and the system sleeps until the lid
is opened. Setting wakeirq_dual_edge_errata for x1e80100, so that
pinctrl-msm primes a single edge in the PDC, didn't change anything.
The system still woke via the lid IRQ after 18 s on AC and after 301 s
on battery. That points to the line itself dipping at CXPC exit rather
than to the dual edge detection. On the Yoga the line's pull-up is
GPIO 71's internal pull (the DT notes that pins 71 and 92 look bridged
and sets 71 to bias-pull-up, output-disable), so a dip would fit the
pad pull dropping across CXPC.

The Windows firmware handles the lid differently. The DSDT reads GPIO
92 only as a level (GpioIo, PullNone, field LIDR in GIO0) and takes
lid events from a separate _AEI GpioInt, pin 0x340 (Edge, ActiveBoth,
SharedAndWake), handled in GIO0._EVT. The X1 board DTs with a lid
switch (XPS 13 9345, ThinkBook 16, Medion SPRCHRGD 14 S1, Honor
MagicBook Art 14 and the Yoga) all use tlmm 92 directly, so I expect
them to see the same once CXPC is reachable in suspend.

Is a dip on GPIO 92 at CXPC exit expected on X1E80100, and what does
GIO0 pin 0x340 map to? I can test patches on the Yoga.

Thanks,
Birk

