Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189955;
	b=Pqc0SDSkCDnDkmQ7mUUgVRA2eLsFlawDbugbdfA0odG861tt3m0ht5Ixv/oidTASqWiY
	 hwRz/IPgeTvLO0rafZKYKtFGkXwGLVnX9JC9WUOtelVFl95FmQTTUngpvyHHJH/UYoA2B
	 0S8JZ1Cyalrgg3W1B35wOmkmleePHMPORGFg3xhoqOHroWPpDkXYQOQhM2a/FG4/JYqdY
	 DD6GQr3Mzvf5QYFHTIAQoTZxtkGuFi3aZlLz5oSyo1PD4AcmXtEXC4U7vUgNmxuZHAQA3
	 XcgN8sumszhJOx5GmWktT5m+7j1/1kMfJIy6sJhewzebdVQIs4oJ/5XaDtdwt8loKHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189955;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=CwicCWX1TDxY7EFve1abJlZFrEt55lTTQUzzVXHuQ1o=;
	b=EH/uyGSGGyQppjmDQmGXoEmigEESd/Ea9LXHBZXpMp26ztRXDssgzMLw9Kh9pmI1wlEJ
	 fRvPhc3QecOR2vdSjWeP2uiCpWe4gj6YDtujLeFhGLL8VQHalvVqQggG2EvRlGgkD3F+7
	 XOoZgYm57ke9rYTzDMKc8AMLieRc37NUcbjW1X6Id03vIkbNDVIiR6O6kIEVkrXIqMhuN
	 uA3aAmpXOOARHTgC4fcmLUEqeJvijlKe3CMzdX1CDNg4/73d3b0QgD908EbPYIt/iKZUt
	 wSp5CdZycx6hTuovj0pSs6gnfH067aD/XxqoLOgIdd7/8W/LKrdnw609xAjoLxDhL+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jlLZS+L0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB56D606A33D;
	Fri, 20 Nov 2026 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jlLZS+L0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189954;
	b=wumw913VvYmr9PraFhWXOwtsICW4MSsgOGahcy2Do+6L3/ZTJOUIwtlexVNOkAtjAt+e
	 N921JGTGGfTRWDweJq6kjtklLbfpNl8Lpf/Cp6vloF6aPksWf6+arhG0k7iO/LsT1l53B
	 Y1qhUKEdIG9q+RlC38Gyj62zb2TZaB0CxM1+vHghrosDimXU2mMAjwQbXyePkBqdHhnwN
	 OfTmFkO/frzeaNvPUqikjYsqr6/PjZ63kCwi+ny7fJdPYHrrlYgnJYD9DEXdwqgNqnDO8
	 wz73ko3nOxNZ+klURzHzBsefS/o6LdKtDhhfN0dfEezaeKUvYlTtyBgQUuTMNJN5v3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189954;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=CwicCWX1TDxY7EFve1abJlZFrEt55lTTQUzzVXHuQ1o=;
	b=lo/VAeS/8VlFNlMcJmUnZs5h+jQWnS9Nf7cJw6I8X8OL5l4oFj7u5UdAWZ5pC1pPyXqs
	 UeeXKLDsFnJa1ARsR3fbiikZi/A40aqRcY/S1IaOE3B38GUamemVkYVH+NECcEUfmk//K
	 BH9rN11aIv2Ar2rGfZ0rWi0VVm+ddOFcuPzGPYeoV058uQ7TdBY5IVlXsps0PCskaOIgi
	 q7BhENjtgEKBWvyyqnVDB+5B2oY1yy15zc7mgLdfG4z2/+Fsu0zTSLRbpxTaq5ZK/WA14
	 Q7aiv0qa9J2QqpJygsFLEoJs6uk4eBhNzJnqYvf1/IghsC+s7EBkL8e/YqkBM34BUJA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8681E1F000C4;
	Fri, 20 Nov 2026 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189954;
	bh=CwicCWX1TDxY7EFve1abJlZFrEt55lTTQUzzVXHuQ1o=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jlLZS+L0E4WQJb6p4WBosxf3VmyzZ03KEgww9SvMyT2xWNvYrytMjwtPdvUGcyuNN
	 QYQE8qXdoA8Msz9ABmyLZX/YGIUhItljzPTu2kQSuWuOeU5ETE4hiUuYpj56T1G+D7
	 4mRBCmGn6DkP14cFtD2I0sSutSJaaSQ0a8GLvN4jpdA8ZS/UFffZuIjUmbGHdPYWY7
	 yTrliunwoiBk6zR1ZQIuf1j3jw58SEECfnlDoT890OByZkBPPQDKhS33Z2oaNbT7yY
	 wP2MVN8oq4fvrXUSXgjFh6yx/mA4I3ytXMKOw3NXpPOInauf+udTkkhasHu1wH67rM
	 wIIOZ+66bYgMw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 042B64990F;
	Fri, 20 Nov 2026 15:52:29 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add the Molokai TLMM
Date: Fri, 20 Nov 2026 21:22:27 +0530
Message-Id: <20261120-molokai-tlmm-v3-0-e5fc37e37011@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ7CIBQFr9KwFsOn2KAr72FcAP21qBQDldg0v
 btQN250OcmbeTOJGCxGcqhmEjDZaP2Qod5UxPRquCC1bWbCGW8AoKHO3/1NWTrenaNaMUQBDe6
 gJll5BOzsa82dzh+OT31FM5ZGWfQ2jj5M61+CsvuRTkAZrbUSUjDGuNHHSfXeb413pKQT/yfzL
 Au+76SRrUQN3/KyLG9ec3yc9wAAAA==
X-Change-ID: 20261116-molokai-tlmm-ba0ee416e513
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189947; l=2704;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=r7Mtff5qbkeYb7DWH6qJOe5Kqw7NebkDFy5PqqoVhjI=;
 b=ongauZFwcUxBohtVhaqb80JrNTnOz504zbv9cJIHEpXrYuJqwAMh4uCUDfypLMvYIRT/IEqnr
 WIBVqyiIlchCvZ7TRwxA8jFf0GR2S+pZku8cAf6tibCGtpOWWLyhpAC
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

Molokai (SM8845) is a Qualcomm SoC derived from Kaanapali (SM8850), found
for example in the Motorola Signature. Its TLMM has the Kaanapali register
layout, but 205 GPIOs instead of 217, different functions on every pin and
a different GPIO to PDC wakeup map. With the Kaanapali tables a
wake-capable GPIO interrupt is routed to the wrong PDC input and never
fires, so this adds a binding and a driver of its own.

The SoC and board devicetree that use it are sent separately in "Add
support for the Qualcomm Molokai (SM8845) and the Motorola Signature".

Tested on the Motorola Signature: the UFS reset, the keys and the GPIO
interrupts that go through the PDC (touchscreen, amplifiers) work.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v3:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter (Krzysztof).
- Rewrap the GPIO to PDC wakeup map so that no entry is split across
  lines, no change in content.
- Pick up the Reviewed-by of Krzysztof.
- Link to v2: https://patch.msgid.link/20261116-molokai-tlmm-v2-0-429f8c8d8eb1@yahoo.com

Changes in v2:
- Binding: indent the example state node consistently.
- Driver: mark egpio as a GPIO function (MSM_GPIO_PIN_FUNCTION) so GPIO
  requests on pins muxed to egpio are not rejected.
- Kept the default 3-bit interrupt target field: on Molokai INTR_CFG[11]
  reads 0 out of reset and the target resets to 0x7.
- Link to v1: https://patch.msgid.link/20261116-molokai-tlmm-v1-0-3ba4840002cb@yahoo.com

To: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Linus Walleij <linusw@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Venkat Yadlapati (2):
      dt-bindings: pinctrl: qcom: Add Molokai TLMM
      pinctrl: qcom: Add Molokai TLMM driver

 .../bindings/pinctrl/qcom,molokai-tlmm.yaml        |  128 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-molokai.c             | 1681 ++++++++++++++++++++
 4 files changed, 1820 insertions(+)
---
base-commit: 7bbad7337a81d1d73559b783280a76a65a9de191
change-id: 20261116-molokai-tlmm-ba0ee416e513

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


