Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941A43F5BFA;
	Tue, 19 May 2026 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183448; cv=none; b=YN0X9whnEMUsL8uBdb/rdckGHUow0Ic9U9KDlje12iTSW7OVVMyj37XVEpmJMWkhypcgoYqnXBrw31we8RISja0ONLUMkgfahVfzTL7jm0seeiRFDabICBXnM2kmETpRjr2Dcd8oi67kgCGux3VRMAPM1HViZP8Szs8TM45sIrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183448; c=relaxed/simple;
	bh=qDdvmjaunk6TN/1qHnT3BTLbjQvZfSxUEzn57UVh0Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=spCLUDeJdUjgjvqHCDWZPUIfkk1uIoi9JqYcGg7cdNBng7y34ygFG6wcvdD7CbB9c7hwPA4fwiua/xnQBaitkAVMHN0CDM6lw8gtSAt7s7I3vmll2g4jcH9cv9aIFNe7XVcdizGsSTSUZBHImYOVGgF93l8axL1838+JwCi1iRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5aXzQVy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5aXzQVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A8EC2BCB3;
	Tue, 19 May 2026 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183448;
	bh=qDdvmjaunk6TN/1qHnT3BTLbjQvZfSxUEzn57UVh0Uo=;
	h=From:To:Cc:Subject:Date:From;
	b=s5aXzQVyGutaB0BSXqGu5ZFm6wQxk7otbeKvXS3DBer4mkP+A8WQ7CQQCF8M39eOB
	 q8xHWMbt6OkPm34RZtvxyFeDbDpmQaZh+wkOd4ijDodKMfC2Sm7XOZPDM5x6fYxpAC
	 txd206E2PSb6UMkKMyusUxFxLVnazryLriOC5SemmIBNBLWLiiV6YkUAMciw4Rpicg
	 QnwBRDUNV9EeO3ijLKa8peNdZVjBpZqI7cTjASOFD/fbDhbQ1jyHF6yKBFfSNOcO4c
	 QlcPDR0St7kP3kLuMurLHmJCbfxxXovJW7QKyRKoCwCbq/W7jAE4CwNa1+1mNPVmRc
	 XeiDYjlk8jDaQ==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 0/4] generic pinmux dt_node_to_map implementation/spacemit driver converted to use it
Date: Tue, 19 May 2026 10:37:21 +0100
Message-ID: <20260519-germinate-ageless-631033d22797@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VEO/EDA8mz9uAsDtHOb/ghhDWuVIsYgsMIHjfhrwfRQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+kEeU15YZOz4/WGtsoukUPPPOMW/D91kWPpfcvQdy ROI7RDvKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETmdDIyPJV6MUXw86Pwu/1p qVeS1oWp+87PWOjz4FQ265L796fIdDMyzPfbvvfftgmfz866x/ynbpPmU1/RnGibYo17GSYVF3I /8wEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey folks,

Here's a real version of my generic pinmux dt_node_to_map
implementation. I tested this on my bpif3 but the dts in mainline is
very limited in terms of pinctrl use so I would really appreciate any
testing that could be done with a more complete setup.

If you try to apply this, it's on top of Frank's mux series. It's also
here if any of the spacemit-ters want to look at what I did to their
driver:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=spacemit-pinctrl

Cheers,
Conor.

CC: Linus Walleij <linusw@kernel.org>
CC: Yixun Lan <dlan@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Troy Mitchell <troy.mitchell@linux.spacemit.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev

Conor Dooley (4):
  pinctrl: generic: change signature of pinctrl_generic_to_map() to pass
    void data
  pinctrl: add new generic groups/function creation function for pinmux
  pinctrl: spacemit: delete spacemit_pctrl_check_power()
  pinctrl: spacemit: move over to generic pinmux dt_node_to_map
    implementation

 drivers/pinctrl/pinconf.h             |  20 ++-
 drivers/pinctrl/pinctrl-generic.c     | 124 ++++++++++++++----
 drivers/pinctrl/spacemit/Kconfig      |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c | 177 ++------------------------
 4 files changed, 128 insertions(+), 197 deletions(-)

-- 
2.53.0

