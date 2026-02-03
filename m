Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B639D2F5487;
	Tue,  3 Feb 2026 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139816; cv=none; b=Eb6gmaMh/2G22wXFFIPJ84KGbBeXsvBBf6FnR1ULPX73dUZ7g/VphZ0jIh7AAJixxbAsw3zBxvLl4xrnaRx+7tRfIG+CocwM7DvBtsjhuZlK/0pMC3jUliJvN0jiXp996L4j/lchRlobzOYEH3SM/X2cgSUMNTzi9rp+B6TDAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139816; c=relaxed/simple;
	bh=qbpaCz16+IKL3o5zdQh/CjxHDfdFrbH1zxADlFBhemI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdTDqdToJikxiS6x21v/7sQuMjjn7wQEx623lCooZjVWcMSb041p021uVp0BMysBujmOwQUdMzfDBKpUU2UY0U+40AkHh/JRiqQFDbbgM8NUtarvCyXkPJiA5XvnZFAvQJTBW2PJ04/b4eEmx8mU7J8gT8zad8C9aFelcQzSHe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLdQNw4n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLdQNw4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAD3C116D0;
	Tue,  3 Feb 2026 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770139816;
	bh=qbpaCz16+IKL3o5zdQh/CjxHDfdFrbH1zxADlFBhemI=;
	h=From:To:Cc:Subject:Date:From;
	b=jLdQNw4nctAW0tsY2tP6Zk2kGU0l3T5iMnC1XVUT+nvtyfNzVVij15lgd4ElfLc6s
	 fXt550YC7nLvik6JM7KPv4wqrsV4ddkUAKK7g2Ktq3SFl4pCNxezCMoilAeKDUa1XX
	 u3ih70TxY91yCsZKlbPX08LdZ3/TEqrHe4ml+pPtlUDYfsTQ8e/KLmHtUhPuOawQTZ
	 c8v9BgbfksHCPcGSPWw7maPKWtmZmNx+xm+Zn7TNHdeHvcJG8puF0xPJm0rjz2pMbU
	 yMS2ikEfS+P3dyRI9QhuEk2Gs5NfhNeCWYCA79fJqRQveqH3NI69GQW/93UYIeZBIX
	 gW0iQWYVDUmiA==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [rfc 0/2] pinctrl property checks
Date: Tue,  3 Feb 2026 17:29:41 +0000
Message-ID: <20260203-device-unwashed-ed24f8592d79@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=935; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3uRh5g2T+/PLcOva7VDfhDo0k6FRaoejSeV2ai+QgoU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlNBi2qBi1pwnfeHlvtntPveNGszWfCdqGaRVYfbJIjx Yzslu3oKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQeGzD8U0rmPnPm9kx7z7uu efUSaR2SNz4pdLrNeFUjt5t37W+5qwz/U//lsJ7jau+YpaDRPfFxhIbp4waX/x5KcyQPymrc8ox lBwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Hey Linus,

Finally got around to sending the property stuff that we were talking
about. It's definitely not the best thing I have ever written, but I
think it does an okay job of warning about setups that don't make sense
while adding fairly little complexity wise.

Cheers,
Conor.

CC: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  pinctrl: pinconf-generic: perform basic checks on pincfg properties
  dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting
    properties

 .../bindings/pinctrl/pincfg-node.yaml         | 105 ++++++++++++++++--
 drivers/pinctrl/pinconf-generic.c             |  41 ++++++-
 2 files changed, 138 insertions(+), 8 deletions(-)

-- 
2.51.0

