Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184126;
	b=THMEB38xaPfCODvn7/rgiBAIQzLU85gPUNXRffexj4lY0iSsO71tGeM8Rv8OYABgBpnU
	 FGKoaSsCM/gXI6spoHTCZkmYZclpA6AMHfSgmP5sKwOfo+X3GidpG+f/trAeRn3Tx8NtT
	 3KvmB3S3XMBp2kOkISp1/IR4S+ESdBb1HWO/KzJEjyr6Fg24cInVJnI1X+viaE05sEyrJ
	 a5g8neoqC385kctjC3ax4hGEqlTqI7qgSRTnt7qrenwCOxWBjfdLcnskZifwET0SqixSb
	 bscpr7hRH1Vn1vAY7uL+qo7cACsR4RYE+tjUFRRGfNGzuUwDax3BS43bslfUo074u7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
	b=KCJMajeFwIfXEjwn4u2l3mjJGaAEPJz1xw9xNiIXE/szjzNeNL10oL/obiQkzOPhYwYZ
	 2XWYwWxrzNz17mkO8l/ylL6XaBbUUwQ9u/Mvq+sbZJIQWjUepn/E5LsJvAv6AwBNVnjj5
	 4NgQst8xnsWkui6nK4s97z4I4GsCpZhfMYjs9fu3CYtR/OphKW9cNi0qjAKVC+BhWo+bQ
	 1vGR60ka6GN8vcFtFA6/Oe8IrRp4FCfcJnveDr91v8Q2FyZEZ5u0LbPLvY60RjPI+4ZZX
	 Kmw0jJj6PB1Yekr5gWFXqgeAIkVI2VKIDRbAPNniI85fVLsou8R76L+1yiN4mNJnekQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl9YKQ3L;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB25606A331
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 00:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EB25606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl9YKQ3L
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49318428d98so145280f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 16:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184124; x=1794788924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
        b=Hl9YKQ3LPiAC1ak3hn+x4wYzGK7CwQBDypqxM0waL3/tJ/CPZdBZMZ/dNnSpy4WV8O
         HwxFkxDdSfjNtTEn94py7bp0bjENVagTy/CNktLzJUV3VO4/OPdT9IVuX7cxL2ZkiT0r
         xZE+FUalw7uaXwXwQSPXf5MdzMB8wU8lSEa7hP5SCUF/B7+mZ/DE1XXs4eSXQG+wbXaM
         p8Oxx3gp3UCpY9o5A1muMPhR08MBwbPnAc2XsmjrrafUr8GtYNvWz0uAecM41tBVlYDb
         EY5m6RWqkH1NarycP0gRkVZ+z0cSbYw2XWg+H5oIiJH4q3JOnmM7aa5sHDikgms+Arm7
         OJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184124; x=1794788924;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
        b=iET61hlYtfTo9XD7APTCvU7CMYDbDcuBk35OriqPMyvzjNcmh9RnSfPlajpJfZ5n0I
         IUN6kCGtQybvk+EyKQzoRDvlGVtqWR41GoQ7Ypayd7jjL4VRMJln1pj6yZeV+QkAZ3kE
         hgSuXd5lrAt961+XpQ7fuEijm/jtS9Ow5n176E+z7b1kbHmQqy2ZKFWFkqZrq5z4NEkd
         hps8QcDTWGJDVijqpFtRFPK3Nb7ZzLPQUKH6ZF4w3NF+LvVsFdvR+HmtE6ZFCx6RPoCX
         AKvm9r8HuD5GrP5II+RPRngQuAJj2SmLUaZHdrb/aH5NcIbsyXdXxJ2FogF74Z3URZAK
         ei1A==
X-Forwarded-Encrypted: i=1; AL+hErF8mHEFHhpBbEVTSlfENOvV4M+nyCEXm+7zNPajNbOj3ns0GOa3GhVoaYanGClAtHTWaus/iSl7lj4j@vger.kernel.org
X-Gm-Message-State: APuU4Z/1+JIRTQYV2t0Ue7m62V9H37WqktfIG5i+Asj1YrGV6CufoK8/
	mWUVL5O4mi2XQuyo+0l4enCZCHsv6KeUCb8d7xSflcZGhnRDYY+k/INNG5B9WGm4XrI=
X-Gm-Gg: AYBFou3NWkUsewCaVdQVxnb98SgNceQ6p4XYVlamE/tEJzVvI+ifwyRpkuMfrlVIzVB
	irfDGTAShiCVOUvHe8tXiA2VxYjKii61tB0kicmzLcndEFyDD+h/9m1l06fPMnH22/L+sVGbftj
	XbYJroMfI4+XpWbqWZp9TWW2j/yMG/QxF3IIoC65FZ2tqlGdEw9w7HohVlNsllh4Vtm8mtuBlMn
	/+WozOKVcNQwWy5d1xQ5jUPWzqsu8N4xvPuGS5FLaAOp7JIbHJLN255J1GmKp1NkbKle47SH5c5
	A4QVtwm/a0/bzeDvYA+wRw+tqBf8lyVRyMSzyvd1CE3EC/O4iVv9XhJW1hx+3skp6ldd4K/7HAt
	DKy3A/Um3mnZpFjJ2INGA14Lrw8GtjYfHq4q/mFV2GMrPanVdTpWTy4J5mPtJUWOZIfUcLcq8hf
	+A8wDq65PUzxsf6Lcu7lohFupnYnoUsb0AnAdCGCrfyNpJNOxcyPWGx11DTE0xMxZloJgaI3kBP
	O4FzWUf0S36kgtTtKGs6Hxa4lwSuePAV7iPxHRZ2aKh+UQgp0J0lFQtseX82brFMhgcb0fOPqvH
	dA7kt9JnZloBlNmrgHSePOZ7tJnQvkH3II1lgGmdnQ0VqthskC6uWMFGYq0hyw==
X-Received: by 2002:a5d:5f51:0:b0:48f:bcdf:6f68 with SMTP id ffacd0b85a97d-49589867ad3mr4694876f8f.37.1794184124022;
        Sun, 08 Nov 2026 16:28:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49673b94dc1sm2688388f8f.16.2026.11.08.16.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:28:42 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Mon, 09 Nov 2026 00:28:36 +0000
Message-Id: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALQT8WoC/yXMyw5AMBCF4VeRWWvS1jVeRSyKwUhd0pYQ8e6K5
 ZeT819g0RBaKIILDO5kaZk9RBhAM6i5R0atN0guUyF4zgalNbXqZE5PE+tkwqMs9gty8J/VYEf
 H1yur33arR2zcG4H7fgCD5MbGcQAAAA==
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184120; l=1085;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Sh78VNHMNROB3r4emRNABR7lWHBZToMwYlli1bwKY4I=;
 b=/DV44UnGt8sgl2eNOLqbZMptCZUi5sxdpNvdt6ndlPLFxWToXTFFFhDVgnkngnv9IdEOvTtlV
 ERnbOCYssFTBDf/BTxvGxy9MTa5fGhdJG9Uq3vUsddO1tW0ylQq+5WU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1825 ++++++++++++++++++++
 4 files changed, 1982 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

