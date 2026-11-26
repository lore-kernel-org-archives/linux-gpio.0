Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706561;
	b=hvdILbf9EpDj//5K7D79yxzJVkGhlObnqrNASPC+A+JSYg2a9XgLfcJxXmVcymSoSRVA
	 lJRXDL7Ur9alC8OhTCmFAK9K9pokRCG4eMCC2m8tN1Mq7ZMHCX1BC+l+6FdaWofQ8hzeq
	 X+8N6jeMTLDc5UEbtyNn3YEngEyFyVTk3EpmM+FLnoIiNjXxLT+NI3uE2Cpba1qmWlPIr
	 6c/wBXqRzUNP96E/p5PL8sFEmZmeNAXMp+uI0UA7Qv79LoJCW+c17hrQUtCN4Cz/GBRnR
	 +l2Hge9S+mniyHAvaN4pNEEMbQGM7VEGDAXBtGoIT2Rzr8OCBHGazwpX03x5frrKTnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
	b=hWzO5/svMX4W5UObytfSkkcU5hQc0wmoZuTpPcGhBVnkQZu3zc5WSQ0kEriBSNIHECDa
	 gVPUEF6fdofF8sL5caxTtm749ozI4mHLGmJu1VMwPaOPRq1d4D3PCnLweR/5tGj+i0NFk
	 ZtRgbIP3jNUF/rzUkPKUhSo50DS0xbhHqd+peKgDFqnT3ZgiZRKxZXFRgnszOkVk44GET
	 qvnlogQKRD8UPo5POHf1Rn7l4jerWoGyGCeDcGCaSLbHS59JW2zD7UGuH6OhxQ8kudqwv
	 /em6UJ0Ei+Qz6Ut9+6vJbzsJESxj1ZCv5j+U6SjTtU04ebnjESGz2pnVzW0KlfX+dpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDi+MWpz;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFDE606A323
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFDE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDi+MWpz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so6559477f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706559; x=1796311359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
        b=qDi+MWpzqiBvWgwSOPcp5Bs3CfXNH+cOcpFQJSl+RIc6CH5tZlaLUj1iH5K63qXesn
         xxPWPzxoH/Wr5Zgo67x0S18ZH7SdnyDipqkJlh3d3WHtsWGsfRL5jWCgjcM74a3Z6j/u
         fSJmLvJ+R6LM6/dQ8p3lWoaxk3l92dSawUICIKmJCGh8jB/VRkeMjkXQOoMJGs8PPnR/
         0oAOwtmp18ownkufiDgF/vbNxqfSLg668cuFtmlj3rh5dDiVJN6e9zzGIlvtgVMXumqH
         h6pSoSsa+T4bRQpm/DodcogGBrdlC8e9PIKgqxrPNRCs5fzSCmFYmoucQAW6r9c8y1JI
         Prqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706559; x=1796311359;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
        b=JagHeAlFMlUyb+CVwSd4JS7COq/ILRY40RWhtpVYpEkAczs2RMXj2LdxjvPxZTw27C
         6+rNCVINI74nsLfHuyTp9lm+ytu+CrwocGHkH0HMi+EWGQnxbEY1o+DC7p2mODzXKswi
         bbeEAbVKOIsC92Sy8f2reKQtYmMe5JXfYZnQxqszuvYUa9EIWqVLVqArwJLVFfoaU7bu
         ECj2Iq1OpLIcgcN1OQSmr7Mf8gXAvB67+ziCnyNTvtL0NXpYt0bW605dBZyIfXX4vark
         mcdSSnxcDBkOWNxcYa9fm/MaQrwYW9hZtvFak+jqPis/zU7VRKvJgu0Z9522uztQaedl
         CukQ==
X-Forwarded-Encrypted: i=1; AL+hErHkGHm+cvWfly2SRm9bovyrOjIQ4JAGJgwJAh50ryWIUEqISIt0/Kwt/AkqHRwf6NrmVl0wbYIw6Nty@vger.kernel.org
X-Gm-Message-State: APuU4Z/PhtCtIE8T01iyUsp7u5oQ8IaGoBZ3e1rT0b7Iz4UvFuhkDIOA
	ma4F8MG4/UzPBffeArb8Ym/3bRLM9MJdTzI++VW9bQQDAYfnVTJYFgd/nyykGg==
X-Gm-Gg: AZFdTZduDcGF+3iQK/W1H/yUeOCW7R1U/zO03cAvpL1wQHwVpOG8BWtT+cApqJ8/RK1
	MseHME+H/3u3z8VYMkEjr/kOKqTE3nea+aHe9TbzIxPHotemhlePvVhLbtiitQDhZZq3aINDkMH
	3GV8af4sBlb5iHd6a130MG7SrMTOi7vBylQk5zVZcY+CYcJdQtFKZWV4cqIe6aiirMTeSxdV5WB
	hqxkS59SsYnNTAuSS+2WhupfO9bZ/mjJAw2WJIkHoLJw3dncybf5b7R6izz303eO6d0nKVtr/5T
	YFTptq5aKqEeYn49jc55h9bpHxem5c8djofwi5CBZw5dr9JCORWB2IyfYCW9p7eETGQnfhs53JU
	VOy+fQnFtTjf1QJnEH86esBiHehYcanAE+VprCDKwwH+gbCWOLk7fDkOCrvFZClBK1kpqt4/NXr
	jCBZPeOzsbeLQ/Y8LaSp3W97n1fxdmIcRctroYnvbsbKRiGql606hswaq1GPKaiIr5rOGaJXzbZ
	nJ84VxgI1j8Lz9lKOFM9sDSUyVADMF81KI518KfRWOrpwp4uVTa8t/oDO9vk/JExlz6szyDzX5o
	yod1F68glgY+DvCDIKyq9oGaNhlkSQHC43ToSA==
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr451013865e9.3.1795706559520;
        Thu, 26 Nov 2026 07:22:39 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:39 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] pinctrl: qcom: halliday: Add the gp_mn and gp_pdm
 functions
Date: Thu, 26 Nov 2026 15:22:31 +0000
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALdOCGsC/yXMQQ6CMBBA0auQWTuJbZA0XsW4qJ0BxpRKOsVAC
 He36vIt/t9BOQsrXJsdMr9F5ZUqzKmBMPo0MApVgz3bzhjb4ehjFPIbljhNOMzYLymUWik675g
 ctZeWCOpgztzL+pvf7n/r8nhyKN8jHMcHLsoeW34AAAA=
X-Change-ID: 20261126-halliday-tlmm-gp-functions-8a8ed8d454dd
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=1110;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=HD8degU7LtTIkgstinfaN6iEKPajs7uLNNN6OR7dmMA=;
 b=DbhUTn77kjaP14rmgpnE2tKjZrsTz+eG3NVAKIQqBaftM/TYrwCoShxPg/rNFmKWYqst3Mam9
 XgfSwrfmVbdAMzsG5s4pyXsc1IGO+A2CqxofzopdvEz2keNGSkToRYz
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Konrad Dybcio pointed out three pin functions that are missing in the
Halliday TLMM driver [1]: gp_mn, gp_pdm_mira and gp_pdm_mirb. This
follow-up to the applied series adds them to the binding and to the
driver.

Qualcomm's downstream driver does not have these functions and the
Galaxy XR does not use them, so they are only build-tested.

This work was made together with Claude.

[1] https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: qcom: halliday: add gp_mn and gp_pdm functions
      pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux functions

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  3 +-
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 32 +++++++++++++++++-----
 2 files changed, 27 insertions(+), 8 deletions(-)
---
base-commit: d1e44b75cd10eead6750f929e3cf68febab8586a
change-id: 20261126-halliday-tlmm-gp-functions-8a8ed8d454dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

