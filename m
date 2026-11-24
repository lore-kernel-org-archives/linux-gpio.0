Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540467;
	b=0g6FQld7r+OJUfzidjI7ftAono2aq+0XX74uCT5t/ZL+bEItrxAABHH4ZgL3Edrtt4Qv
	 rxPjE+eTVEVaeXGqmc/vmqShDKASH8mfwqefqi14pqov5zAthjbtxvvX2ZxqLdskyVAlj
	 apXkP5q/tlg6xF4/DPrx+/y7rztfsXm4oCUPeCg3PFByInVEh4suomnNxxowu4gxnaok0
	 F8YRAvbbaNBwRPKhDLr8zJ7ipoW3W5wQmbVpCP4ZWx0Nlj93HPEIGLYox7gjk8jRPkUuw
	 7rIMdbN1PCKDIcOUkSPDInY9cZQvF17qhv6cs3vu4zvgbKubYUpzfyICG3Z47i2XANw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
	b=JK7IkqC6ITt3WbyUN1fyVSPVJzUG8ha4yve6d5YSxSVUeqJhDFcN30o1AoQ8BqGK38ok
	 xfPoTewdMQuW3dCkjRVz09kksJ+SZBzVDstITmYvpmZxe88ui1NpOVI2E+xt35vEHqYm6
	 QZpmGaXuym/iczJZG9Elmcnf7gCi0XduLXVbYsXGiH0MC3GXqGL/StZBzpiZJVIZhnyVm
	 mH5OtWyGhbGbjmiZuJxEXyiLDmtCz2sfJ+H5m7o5GBq7caVSWu+VPG6jQ44naaCcKhfW4
	 vWIMGP0bOC3voFFGJBSiAIDOxYkyXAJMSGWVBCPBM0JCUwQ2cAaew9zSkva87qO49/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hAzaf7HV;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D106606A327
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D106606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hAzaf7HV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so44117575e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795540465; x=1796145265; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
        b=hAzaf7HVGSe6Ta8UOuiGwSzU8wC/W4gE7QFjKOfpPImYeKL433CsG+nsm0XitiI1GD
         y17PfOXXz7bojs//ht5Lr4ZdVftlbCUunxgWR9BaPcDiKpP+RXQZ6+XfanXrgdokC/FV
         ORgCbrv+8zod2SEdmCbDWYMw0PgTFbBAIg04iUG6aI1/aJOdtcSgB7e8sfdU1iKK74RB
         QAj8u88PbW5EgVa9t1dncQA9pWvfFM7cA/5jINelt96IdYPjyU50Qz9qQa5Cpf002GMH
         UVfpiSLYB3rLu3FH4KQzPF6Xay1mtVXfpQmtJrRjG6kB+BjqoH4Itm/RUD8wEiiXrlGA
         MM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540465; x=1796145265;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hd+I9pXW0sdvyEhQLvxNgU1qRGdrRwFhnl9rqEkxAvw=;
        b=GyPoPOeXv5isRsSv8vmib6bBvx4v5KRCJ1ZddlcWFTU6CIcUxcIItBkB4I7/Tp4UxA
         mUG2P85Y2VEj0vEW2VCt3OkrxiBFmC34UkIV4bNaydF3GMI5QnQ3lqJO5RnUF0zeCzdF
         6l9jF5pSwsmgY1cnvg1PLm6dpgjVxGzzfG2lyPIvzBGh8SaD8RfSsc3Jy7fseOnWT2Ss
         Ln7bhJnWC2N0ihJrFLwWvS9gPEDzH/2BP+tB5q+FvVtHqPLm0xl6oSCttUJQiNp9vYxK
         d7zDW4y2L98ug3VwPrBSshNZMuHkZKLVJQMBJYp8nBuCxQCc0YC9fm6Gfu6uQgYT1vst
         D+tA==
X-Forwarded-Encrypted: i=1; AL+hErG04CAwWsrUSvnEAa1A4EvGNJGGc/CfpPujUPi3WT7RDHwg8ZgBtwylXDZdo6XNsM1Zcv/puDr01RWG@vger.kernel.org
X-Gm-Message-State: APuU4Z/LRvwWpmwu8pxAd0CVDc2eZwgUehenW7Gf9Viqnd3kpu55OYWB
	k0AvAi7Yi1rZfFFkE6dIe93CQlsdoXoVVHJuEX30F4Jgj81mrz7hCb4rTKz8PC0hkYY=
X-Gm-Gg: AZFdTZdAYcsXDloS+QXiiLyM0zdM2u01olqGaoub6isR2zJ4vXXoxJ1RbqYUlmIulX+
	BJmyinsY1+co2wAbeM+2H1dhP8YnwRJkxb6+/uF4IANHAYHlVWnprkZRxOU7OH7/DbmkmU2CPXj
	CD4YcAl2tz5ijoaf8lDNWdNe/5H/vQRLq/GoZ110JsgpQ5oUulRwLT1Sus/Q/3RlAVTejgjSVWu
	W6TsDNd/eZj8FdalSxoWYE0WHcZEgY6Ih7l7EeIV2UyeMxlCz3nPJ3XUTpFkGI3oVT546AUfstR
	D6ra4cDnlyFLusRvQnPj0UOrYBWl4IAXt+ttbg16iGMDO1tPYQTSet6Yh5zJo/qaDgNON92X5k7
	JOfIG1blMaIcHRUUUjtTarEq0zAbVFtRqzIGxGq7zFgMIEdIxjLxE837Gtrpw8in3xlTyrvqIPp
	e/mgX3vcEFRMhNKXJfCs1bBjAEZqmSBa72BE7GuOZUjYPgg9Ux/Y0dh1gN4DevYWGgB/b0YJUlY
	Q7TuS1cOtuSUhPFjQHbyAoGju/6EF9GvHks72Z99XFwmwSTFBRtZIG+VtXisBOOK8K6bwMlOwct
	KO6b5LHjctaFx5gWkQG0S4v9trc5QJIOXYc7rb83/uYge+j/9Oc=
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr314870705e9.2.1795540465344;
        Tue, 24 Nov 2026 09:14:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm410592735e9.8.2026.11.24.09.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] arm64: qcom: enable SM8650 audio without ADSP
 firmware
Date: Tue, 24 Nov 2026 18:14:21 +0100
Message-Id: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAO3FBWsC/32NQQ6CMBBFr0K6dgwtUtCV9zAsytjCGGzJtBIN4
 e4C7l2+5P33ZxEtk43iks2C7USRgl9BHTKBvfGdBbqvLFSutJSygBRGQojPWpc52EHBSB4TD4A
 ajTupokJTiXU+snX03tO35sfx1T4spq23GT3FFPizf09y8/7cTBJyKGVdOG1Me3Z4HcgbDsfAn
 WiWZfkCplw1i8sAAAA=
X-Change-ID: 20261113-topic-sm8650-el2-pinctrl-c6caf4237ca7
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0xZyYQ1QCsRnZoyKEDk/WLh63GWw1TE5/07D9O+VLII=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcXvXtZBbMLDgvkGtCfwe5VQZTIYtV2vlYQQnUF7
 gXNg72OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXF7wAKCRB33NvayMhJ0VKHD/
 9NUveMCAmZ2GPhLrcDur6R6JVJ/4cFN+ATqPprw7UcaSAsfPUwTCEZh0cutkUl72Aw6MK3aXydLHVB
 zKTgqsQhlw7i58wOSG0souPfTE0g/ykG+yFN1gcSGYeAzTSv/V4SeNNjSW5d1Alo30uOxaJyO7Um/j
 3mumUY7ptOKEBMV88BzD09/UKoMFzX5mRQMLl2OtJq0PgFsG7mnQ8cnwg/TA97kyt+yOUPHMC8RDTk
 qLn2a8eDPAHonAmaTGo/3QOFbRL4RFoVOf/tilSizA7I5jA0qwl1By6AWY6r+GeioVP3taxZMzNYL1
 ytFaNdQRBpo2Vmd/LN0OYyuYFMNKDh6NCFfuDJq4dDJDYXTxCpRpL7tV+GWASTu7neTnON1TCdnaDN
 bBUuD1eleDutzYIRyfcEC8rcPnICuWq0bbUuRuMYWA8WRuui2C+aATnqwsPt5Q9NzxVkIgJOBRiAth
 JhPc+YtSPC29IJDcREnBj+1WHFb5AgdC6VkyswcnFb/FtsIbdzvA4B4jHx2awRuCbPfyCgX6VlRuT7
 NpN2zjTIijkVTRbISBt04iDXpuvvpsehdq8PRxKnyU/g+MQJNpqgU/JWkgqWkvfvBSNIkGWL3jsnXj
 91x2U/VQu9iCagAr14CI/vHtIN03BWp4U8MNACz2l57Ds6sn5KOlIDZmCYRA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This patchset is part of a serie adding the necessary plumbing to
drive the SM8650 audio interfaces directly from Linux.
This is required for boards like the Valve Deckard that boot Linux at EL2
without the ADSP audio firmware, meaning the audio interfaces must be driven
directly by the application processor through lpass-cpu.

This patchset is forked from the monoliothic v1 at [1].

Without the ADSP firmware, the resources available to power
the pinctrl differs, and the LPI pinctrl power is controlled
with power domains instead of DSP clocks.

[1] https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Simplified bindings change
- Driver update to use all power domains
- Link to v1: https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

---
Neil Armstrong (2):
      dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
      pinctrl: qcom: lpass-lpi: attach all the power domains

 .../bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml      | 12 +++++++++++-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c                     |  9 +++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261113-topic-sm8650-el2-pinctrl-c6caf4237ca7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

