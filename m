Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6B41F7D7;
	Thu, 20 Aug 2026 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224659; cv=none; b=uYsnXkWTsGh0U1hItsPG/ioI5E8QFSiFKhNgMWM5dXjOZPFgmMBsFzB9FP3Dor3/ftb3vg2SGy2KXCS9j5aKX4aig1RfbH+NlAeb9Jfm9KO67W3c6NZDo8aNJnG2dJWS/eEE+k5AqASBZFneOv77Wxo61Xncaz9KJWdrPhZCbzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224659; c=relaxed/simple;
	bh=RSjpaCF9fBktE/a6UFELoM+28IIroymgdClaLF3mN+o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mmlnDOyhm/iTnKHHwIXfQyQ/DMzKRX+q1GRfR3qhzRxNqsJGt+UYZXDqWCRC7UF11hKUekq6mZTYp7cUIGleiqCy1a4Xi90nXz05i5RVbHewgHUYfbAqUUOMP1F1njSpqLoT9SecMeGIzy0UKyTaUtbKFGOPADn5Qd4EUrhPpH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhC3Dj0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhC3Dj0l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37957C2BCC7;
	Thu, 20 Aug 2026 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787224659;
	bh=RSjpaCF9fBktE/a6UFELoM+28IIroymgdClaLF3mN+o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FhC3Dj0liWv+vDhM8o5Wfciuu5zcr3kVT0bCYu0DG0nDP9wVw93m03j2yIAfro0Vn
	 h2nDIwUdm08idGiR6Gb5FC3dIVtNWpldCtPy0rteYL3qqufi7qkF/9eHF5KmMyPUFL
	 Krl306hbf5vfnkoZIpffRW6nDiSrjrqBeL5sNdOd2fLv90O++DM53FDT/Z8rRbaYMU
	 PUKonjfiB6bZtaUGc9KxI/6E+fHwQd9gVqAv/gMPH2PIgFJGCrX+DTRjEubgnGEtjc
	 kd3BaEfW67X4OshjbLU8Etfj7DMIgP/UzUfaPcchMWVvThAbDTAriD+xT0dK9eZ7vx
	 xWbLMXv/gwKcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07500C5DF87;
	Thu, 20 Aug 2026 11:17:39 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Subject: [PATCH v2 0/2] Add pinctrl support for MSM8952
Date: Thu, 20 Aug 2026 14:17:16 +0300
Message-Id: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6DIBBFf8XMujQysYBd9T8aF/IoTqJowJA2h
 n8vdd/lOck994DkIrkE9+aA6DIlWkMFvDRgpjF4x8hWBmxRtIoLtqRF9TdkGwWzx5lpg9p2qut
 RcKirLboXvc/ic6g8UdrX+DkPMv/Z/63MWctGiRK1sciVfCwjhZkCBX9do4ehlPIFlZigaLMAA
 AA=
X-Change-ID: 20260816-msm8952-pinctrl-bc2bd4849261
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Muzaffer Kadir <muzafferkadir@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787224657; l=1347;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=RSjpaCF9fBktE/a6UFELoM+28IIroymgdClaLF3mN+o=;
 b=mGo5kBGOZpeO2539Z962drHBw9m2kPBd9Daziv7TutmH1bemMC+UmA42qnTKO/u5i0bzhzKPv
 gJJGR8V1r/JCa+4IxV8GlaYxgCX6UborLuP3Jr0LlI2spvs9IGcz4qf
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
has some differences in some of the pins and their functions.
This driver was tested on General Mobile GM 5 Plus
(shamrock) using my own kernel fork [1].
I'm holding off on sending the GCC (Global Clock
Controller) driver and initial device tree until I've resolved some
outstanding bugs in the GCC driver.

[1] https://github.com/kadir1243/linux

Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
Changes in v2:
- Reworded dt-bindings commit as Krzysztof suggested.
- Added depends and default to kconfig entry of pinctrl
- Link to v1: https://lore.kernel.org/r/20260816-msm8952-pinctrl-v1-0-a7272bcd2187@mainlining.org

---
Muzaffer Kadir (2):
      dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

 .../bindings/pinctrl/qcom,msm8952-pinctrl.yaml     |  155 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8952.c             | 1248 ++++++++++++++++++++
 4 files changed, 1412 insertions(+)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260816-msm8952-pinctrl-bc2bd4849261

Best regards,
-- 
Muzaffer Kadir <muzafferkadir@mainlining.org>


