Received: from mailproxy11.manitu.net (mailproxy11.manitu.net [217.11.48.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45863313552;
	Sun, 19 Jul 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.11.48.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469349; cv=none; b=ph1ZTH/gNlScVrV2Nyo1bbT6pgxlKcmOE2JbzJaEnN80HU6gcJwRwYXNf01DJyyDN1BN+iQdFJH3J9OaAucr2RMlQQ4b/srhDMO2lxdy3AGT/ZqHfoTBDFCEqqqgtLWUgKUUeDHw0hFJrGC1rGEyId9VgOu8O46GPAScEMFBB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469349; c=relaxed/simple;
	bh=pai6MXfe/ZwkSfeC6aOZFhlzsMHR5hl/xTqReOfRl/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U72jxKBq87vuLbuxFn/Q3zR4WsWTAZjwWmDa0QyPDgpGueOZuKLcoWaOBUPcjftec/LJ0fFvIBdJ8xHjX4ez5wQ1+0d9JswmZHA68QsNjXykPH7ZT+TeKLGpXAC6VTxKn4JVzd0Q13Wt9nptAthdtVzsdPFwiZ6u54HY/URexYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ulli-kroll.de; spf=pass smtp.mailfrom=ulli-kroll.de; dkim=pass (2048-bit key) header.d=ulli-kroll.de header.i=@ulli-kroll.de header.b=CJDg5nb6; arc=none smtp.client-ip=217.11.48.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ulli-kroll.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ulli-kroll.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ulli-kroll.de header.i=@ulli-kroll.de header.b="CJDg5nb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ulli-kroll.de;
	s=manitu-webhosting; t=1784468906;
	bh=pai6MXfe/ZwkSfeC6aOZFhlzsMHR5hl/xTqReOfRl/Q=;
	h=From:To:Cc:Subject:Date;
	b=CJDg5nb6OnR+L+zFrmp+wT2GaohHqqKv2MvJFwwIzDtefSUYbXebaQS00+61C4jo7
	 ZcMqR0QMaDWY/gbY52REbkwLVSLcAOVtuAykOPSp2Ltcv2QznWhqbQ1GH8bsXNAe0D
	 0T72mKwzZL5qIPDI1FWpHA3aeNtRJf2o98grqRS/I2tWEisqppP4+USbaHcdb5TFkS
	 yZjM84XZ1YqiWe+HZeFVeX3mBgJikqdVg7vrLqvVqdwtvEqEeNpgGsGr/LdIZtiMqG
	 HXYcvqSZFJ/o2Hl7wAh9zQGS6tocEaoiQNz3NIa+Q4kiIflIB6n27ZWtu5xw7tGNQz
	 SFUSSn8q1HnyA==
From: Hans Ulli Kroll <linux@ulli-kroll.de>
To: Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Ulli Kroll <linux@ulli-kroll.de>
Subject: [PATCH 0/2] pinctrl: qcom: ipq806x: mark gpio and pcie-reset as GPIO
Date: Sun, 19 Jul 2026 15:35:58 +0200
Message-ID: <20260719134548.8830-1-linux@ulli-kroll.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The qcom pinctrl core supports marking functions that represent GPIO mode
via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
GPIO requests for pins that are muxed to the GPIO function.

ipq806x still describes its gpio function with QCA_PIN_FUNCTION(gpio),
so it is not treated as a GPIO pin function. As a result, GPIO consumers
can still conflict with pinctrl states that select the "gpio" function.

This allows ipq806x to keep the GPIO-related and PCIe-related pin configuration
in DTS without tripping over strict pinmux ownership checks.

Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>

