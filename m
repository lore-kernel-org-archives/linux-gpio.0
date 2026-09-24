Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70C46D57D
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249030; cv=none; b=mfNzZTGU3BNGPiVUwfH/xoe9sSDPY7Ge56bklnzG9X0/MVREGrbRkOGXb4yvg37LQc/ftqL7um8LlpKV0gwWTRS8BsA6oMwSF1JS1UXyZ73ro0BaeOgel/oX3t4hlnuw7Jzu0ssArYJWV15xO1m+GAl5yJwnvR0JcVNF4szbGjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249030; c=relaxed/simple;
	bh=OjkUmDAD4oz+xbzZpBjuR9oWr5XlqS+v3UAsqgqWTLU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZtQ5g6grTjpS2aVUE1E/5l4BtWj9g57Cnag5Sms/HVvLNF4+JaPYfLCTVLcoXsGN2DHYc2ifsD+d/k6wXOLPuXNkJ4AOFiKDIhAZYA5GHqwyYLFKaVfFk4mpZESfZXs4R85AOK8Rv0dcgwY/wWwt+Vlvq62416exoVJ1U8WZ0uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4E+CWfB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4E+CWfB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A431F0089A
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790249029;
	bh=CTU8Ogs42D+dXZMfPUs99jOT2Cxtsrhzqaj0v6zLINg=;
	h=From:Date:Subject:To:Cc;
	b=B4E+CWfBXgRV9MSkJ7xnY0CqF4p85wE8OCoXJ98nmNpMzcJCwh7ys3JzYiqA5kiG6
	 pOWSeR2zRkaC3If/whLu1VXG89eQQouZGhtgD72VVqExu0TK5r0gBSeyw9GOFMARHk
	 tdCkJ+prmtuOOQpu7rQ8a4lEZk9XOb1/0HJbtBItz8A0UrdVtSWh6r7dIw3t405JIb
	 UEwmsxpE+aptDEOvalt6eHqB3EgCBSelVsQ1O0PlS2xC3YqktK43qnfdvq/InLcVtj
	 sBJKuLWs3DwfggvpjcMOMeMTElF60JWP8jUyfx45HouxF3oqZU8j6jsMQYlnp2Yn1y
	 oZxyJLeymiRbw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d879752fso1524721e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 04:23:49 -0700 (PDT)
X-Gm-Message-State: AFuF++kDpWSAl1419bX0uDSH4ifq1aQ8+vCAujRrbx2+HlYCwUWiJrLP
	P7UDo1OJtHUGZ/O9D55sA0WnMlORljBJkEtGonUt+uFfDuRV2G6JS5BC9p/clNrVlzfkMxDWslY
	His9SeffDp5eyT3qM12uwsImPiFNj078=
X-Received: by 2002:a05:6512:3f06:b0:5b6:1a7c:27 with SMTP id
 2adb3069b0e04-5b8df06f8e1mr816426e87.42.1790249027932; Thu, 24 Sep 2026
 04:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 13:23:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLmSO0q+PnZRo2cOE02P6sQubU0ZYvgrx2sskm1Py-aQcA@mail.gmail.com>
X-Gm-Features: AclHuK9_TBH5d_zYCtFMkyhTuN0r2OWG1lnmkelwMJd_YLu1Ajk2Ug68WJDjqqU
Message-ID: <CAD++jLmSO0q+PnZRo2cOE02P6sQubU0ZYvgrx2sskm1Py-aQcA@mail.gmail.com>
Subject: [GIT PULL] Pin control fixes for the v7.3 series
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, "hpp.iscas" <hppiscas@163.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some pin control fixes for v7.3. I guess I should have
sent some earlier but I was procrastinating.

The serialization patch is the only one which is not a driver fix,
but that one is really important.

I noticed now that one of the Qualcomm fixes seems to have a
weird name as committer (or maybe people are actually named
"hpp iscas" all lowercase, I don't know), it's just a oneliner but if
that's a problem  then tell me and I'll send a new pull request
with that patch dropped.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v7.3-2

for you to fetch changes up to ae2c5bf969573708cd5b6bb6393631255d83c3fe:

  pinctrl: tegra238: Fix register bank for AON pin groups (2026-09-21
00:06:32 +0200)

----------------------------------------------------------------
Pin control fixes for the v7.3 series:

- Serialize the calls to pinctrl_generic_dt_nod_to_map()

- Fix a typo in S4 group in the Meson driver.

- Fix bank width and regmap usage in the MPFS-SSIO driver.

- Data register output latch behavior and voltage encoding
  fixes in the Sunxi driver.

- Free the IRQ domain on the error path in the single driver.

- Fix some QUP1 SE2/SE3 groups and a missing OF module
  alias in the Qualcomm drivers.

- Fix up the register banks for AON (I guess always-on)
  pins in the Tegra238 driver.

Signed-off-by: Linus Walleij <linusw@kernel.org>

----------------------------------------------------------------
Andre Przywara (1):
      pinctrl: sunxi: A523: fix voltage withstand encoding

Conor Dooley (2):
      pinctrl: mpfs-mssio: fix width of unused bank voltage setting
      pinctrl: mpfs-mssio: use correct regmap function to set bank voltage

Ilya Titov (1):
      pinctrl: sunxi: keep a shadow copy of the data register output latches

Myeonghun Pak (1):
      pinctrl: single: free the IRQ on domain creation failure

Prathamesh Shete (1):
      pinctrl: tegra238: Fix register bank for AON pin groups

Sarah Emery (1):
      pinctrl: generic: serialise pinctrl_generic_dt_node_to_map()

Sean Anderson (1):
      pinctrl: meson: Fix typo in s4 group name

Shawn Guo (1):
      pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions

hpp.iscas (1):
      pinctrl: qcom: ipq5210: Publish the OF module alias

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |   7 +-
 drivers/pinctrl/meson/pinctrl-meson-s4.c           |   2 +-
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c     |   6 +-
 drivers/pinctrl/pinctrl-generic.c                  |   4 +
 drivers/pinctrl/pinctrl-single.c                   |   3 +-
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             |   1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                |  34 ++--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c      |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c        |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |  82 +++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |   9 +
 drivers/pinctrl/tegra/pinctrl-tegra238.c           | 204 ++++++++++-----------
 12 files changed, 218 insertions(+), 138 deletions(-)
