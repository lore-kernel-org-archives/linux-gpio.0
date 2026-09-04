Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480838B158;
	Fri,  4 Sep 2026 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524123; cv=none; b=EMCUsybEM4e50FurO3OFyMnkZswageyxphM4/6ZTMsCJfTjH993PEkUH8d5fs37Yq2r2YbxwM3oXv5AXyJC6/Hf0JO31hru/j+jakJJPM3QOA/gOZVNP4UI+0DObP9vMJy6R3V3ErmVo/o4iozp1+f3sQHNiuDmFjm1PWuM5Fd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524123; c=relaxed/simple;
	bh=12BfSrTcPi4xiLBNgNrbzE4C1/0ne2TkNTelRRlK+Nk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bMJeCZTFgWjfgpCiE8y1E+FvKBthrXBLh3+NADvpHqzrA6NIc0JF+Bz1Qb8D8UG05RZ2dERfpICU3unvEvs9s/VGe16FlWpIQQvmykO+/BlMIh/Qo5ebVu3y1CtG6hIy+wGGCX0alJMKljAMmetN8JfuxvEgxEjuIXthn6N7pzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeGEbBAf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeGEbBAf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3CF8C2BCC7;
	Fri,  4 Sep 2026 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788524122;
	bh=12BfSrTcPi4xiLBNgNrbzE4C1/0ne2TkNTelRRlK+Nk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FeGEbBAfUeBrJ5kEIEwGSwifpL79dfm1I+myTrxT0TtKlUEYWymHpGJdfwUhPIuZJ
	 Ma+d9wvsh7ClqBXWv8sl8MHUCNxn4LFADK9INsj/EBGx4y17oWnsfOW+9JqCz+yFve
	 mB4MYtCMqpuGX6oZJH9ode9wQ5IWXDktHBy2EnVlWmvADzOa8n0e1PrIt8Wv6EYXyx
	 Z+fnlhbbLwpGUrSWAzvApCgLdVNqb0TL7kLs8nPXkn+BUduDusgwAcBDvo/Ovt0lfe
	 DTa73sJZLoY6BurgFfWVfIRvhstRbvjlXI56LZhBfBwNH/WYmtBExxSMOLOxe/XWgO
	 uZ70/9u75bH1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FADC61DD6;
	Fri,  4 Sep 2026 12:15:22 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Subject: [PATCH v3 0/2] Add pinctrl support for MSM8952
Date: Fri, 04 Sep 2026 15:15:09 +0300
Message-Id: <20260904-msm8952-pinctrl-v3-0-110515fff513@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQqDMBCF4atI1k1JRmtiV71H6cKJUQc0SiKhR
 bx7o6uCdPk/mG9WFqwnG9g9W5m3kQJNLkV+yZjpa9dZTk1qBgJKoWXJxzDq6gZ8JmcWP3A0gE2
 hiwpKydLV7G1L70N8vlL3FJbJf44HUe7rfytKLnitQAGaBqRWj7EmN5Aj110n37EdjPCDgDgjk
 BBsATUqzFWFJ2Tbti9zpKjZ+AAAAA==
X-Change-ID: 20260816-msm8952-pinctrl-bc2bd4849261
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Muzaffer Kadir <muzafferkadir@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788524120; l=1511;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=12BfSrTcPi4xiLBNgNrbzE4C1/0ne2TkNTelRRlK+Nk=;
 b=gsKkCZmEplMwyOZUY9hO8Di9Llmy5zgdfZBj0UJHiaIxlUdRcLwIDBchmxUk2Ang5y94+BQOF
 iOp6Jkjbs+lCFQ8jVf4MdHlLcb4DwOql3ASQNLD9bmUbLcANPVCViJI
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
has some differences in some of the pins and their functions.
This driver tested on General Mobile GM 5 Plus.

Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
Changes in v3:
- Added missing functions and removed unnecessary functions
  with Konrad Dybcio's suggestions.
- Because of the changes on functions, I changed dt-bindings too.
  Dropped Krzysztof's Reviewed-By attribute because of the changes.
- Rebased and Tested on linux-next, next-20260902 tag.
- Link to v2: https://lore.kernel.org/r/20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org

Changes in v2:
- Reworded dt-bindings commit as Krzysztof suggested.
- Added depends and default to kconfig entry of pinctrl
- Link to v1: https://lore.kernel.org/r/20260816-msm8952-pinctrl-v1-0-a7272bcd2187@mainlining.org

---
Muzaffer Kadir (2):
      dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
      pinctrl: qcom: Add MSM8952 tlmm pinctrl driver

 .../bindings/pinctrl/qcom,msm8952-pinctrl.yaml     |  146 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm8952.c             | 1194 ++++++++++++++++++++
 4 files changed, 1349 insertions(+)
---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260816-msm8952-pinctrl-bc2bd4849261

Best regards,
-- 
Muzaffer Kadir <muzafferkadir@mainlining.org>


