Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794773965;
	b=V2MCEtujSMeTW3Xwpa5yOxfQj6uc3S53P2xXE3d7WskYbm3WYYPZT1wwYhXCqvhiHdhN
	 hJUDZP8WIcAFvImlXz88kCqkDKMwTV0jk6JFy1c5XMyCSTsAE6uervS9zPYXkunnRuEkB
	 s4JqUHh7P74+M5qF0JoE3v3JGlXqhNoWi6UYi+3ganTHzsJbJTXJ/WgpVNN4Tl9jYZr1t
	 NyiroqbhIXR94DENhDhW5pQCaTlFDKR2aFBQWbWsKjAXN7WkKb/8UgWjLNPkRcPsL4hee
	 jtPl7V28D9xdycWKIg5AcDBtBRre3f7XP6+mKkb/pA85hCWDp8l4eDPVsUU71e8fD6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773965;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=aae1bjh24PUdqN+Loi5xRzc5UHxFDAQVmu+y4W/NfUQ=;
	b=U9CUyOnISVfkys6AYCrRP3a3TqfDUT1qOKU5ENmfMeNUvyQFtM/D7OKGi6Kl21vfI/n6
	 XSn682/PnFkpIF7za7jlbEHGVqpKnP28b6xOZABsbybq2mFQJRH71IKe+L29WG9qOV1Mq
	 0FG3+eV3aE5aTS2TIt46I3xf98SxumQb4Db4X4kJweanuOKHoZHZWYehXccQeEW4uXgrg
	 5RhJdrk9k0E/r4cbKZ6SLGmpTA1tnbJNJ5dRcDa/adAQ12WMgGmPPHUwbGmfo8qqjVNxb
	 w9UuGPHV0rUNFOr01UG9pbJz3I6l4/jKlj30zJzpgnT305DqpSzlIs30jT4oKZrP/Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWfWGzt1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67834606A330;
	Sun, 15 Nov 2026 20:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWfWGzt1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794773965;
	b=t6dSadnpIjqv8b+RPfCdbTQSJLIiX2LXI7QAQe7CqqHfidhCGn8qP+DX6sjUJZ+1qAPC
	 b4UXwo29P/63Sh21H+4KigRCv4EdESReG9No7MmB9Tpc3HZ3RA1FJK/vmG1pIDjYcfm93
	 3NBWl9M0EtOLdHQDJMI0xqIq/pwMc0e8PB2Magj4XKnm2BqV7h89dW2QIzQ1taVGmhsbz
	 Kqx4A18FvMXL6of/3OWb9gyiK1T3QsGowlAls5aO4CMzf5ldHYLDWIoI2iveRIjnjJVKe
	 PIOzTLs4HVMKJL+b1AI0qCjJkd9H5CwKtV+orSbv6DQpcEtROkhUfS6o+4jJIVyYmjg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794773965;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=aae1bjh24PUdqN+Loi5xRzc5UHxFDAQVmu+y4W/NfUQ=;
	b=1edQiZvZfgpiZ3NFEa7l9xgDLmLvmSkelb3wAerz8YrANKXZn84q0fISeiUe4aC1wCs6
	 oVs/drsVBNlTilIVAWjnRqGbVc/pFufDwTgeus4Cd45S48NxCt7EspiPqo/cGG6+SoYbQ
	 WDH6s/zKnEbEPkFzpyl7oFcMkVP5nN4VEnLlYZPLvAu++dmGshumXWB/q9P9Oty/CmyD/
	 6yZEN6hn+u/QQqdmaeH3p8OqhSuriv/lmbSV2u4zHItwm3gzfvlFYcH776FeuPg3W3pzI
	 3p9S8pCZihvH/uGfvGhX+PehYoB0mDPKCDdJ4NJvKhEq/s9IYuGPIjgyqI7LmIHmCqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 819081F000C4;
	Sun, 15 Nov 2026 20:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773964;
	bh=aae1bjh24PUdqN+Loi5xRzc5UHxFDAQVmu+y4W/NfUQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=GWfWGzt1IqHwQaAC5/LaUVihv4N6R2KvR53SumDY7BYcpFIh21Vi857wlPI4iXGxs
	 VHel/ovxl+avD8dgki2KbTcjkhkfXPOIuRFdUj9BcewhvZb8zkxTnQuIxb52rJzxe7
	 zjFyTCWnURsW16dfkNUr9sa3q2y1hN/SI+ixsbE4v6e0fzHZ6LAoqSHNXxIJBJuOYW
	 EkrIaw2o8ii7XQt+E5oj5ZXjR3Sl6CEX1b4oIoxqN26hGf9CVfdwLwJMeWg1F3o/13
	 PT5l8gTgpiKW+WjajTHf7ygDLv3I6bWh6vQA1Ee4Gt7CbJUGF8ZQCKux8Z81pYKyhe
	 0FrmCOYGGwL8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 110544A185;
	Sun, 15 Nov 2026 20:19:24 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH 0/2] pinctrl: qcom: Add the Molokai TLMM
Date: Mon, 16 Nov 2026 01:49:22 +0530
Message-Id: <20261116-molokai-tlmm-v1-0-3ba4840002cb@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EMBRG4VeRu9bEZXQxryIWxT9coyotIhHvP
 mWW3+KckwK8INA7OcljlyBujuA0oXYwcw8lXTTlWa6ZWSvrJvc1otbJWtWYDHixRskFxWTx+Mj
 x7Kr677A1I9r1ftB1/QBl/OSdcAAAAA==
X-Change-ID: 20261116-molokai-tlmm-ba0ee416e513
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794773962; l=1461;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=ycrpenfnV06XhWlfcVWQ1HMmfcwzHDxYlIujTz54+LI=;
 b=OXUKtRiR3bN02LazYY80nM1rysJOYuqGc7EfCK1ErDXCW/w7ClFnBr/9vpUf9KDOu9u//uHi2
 hjoXzWW0vnpC4l6q7FKapNOkjmB25tNDI83Mn6YY3MayXH4YGDBEZKy
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
Venkat Yadlapati (2):
      dt-bindings: pinctrl: qcom: Add Molokai TLMM
      pinctrl: qcom: Add Molokai TLMM driver

 .../bindings/pinctrl/qcom,molokai-tlmm.yaml        |  128 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-molokai.c             | 1679 ++++++++++++++++++++
 4 files changed, 1818 insertions(+)
---
base-commit: 7bbad7337a81d1d73559b783280a76a65a9de191
change-id: 20261116-molokai-tlmm-ba0ee416e513

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


