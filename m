Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227F83F5BED;
	Mon, 25 May 2026 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779727369; cv=none; b=rkckBMUBHgpCZ7T0HKvgSfTwVFoPWlUw/kws385s4I6N76BlJZlEW11IVIGHKdzBLqOYXUQeMSfpUTL3PbEC7vQlPxamvqzEphElUTKctzOP6/5+iZ3xdIQG6zPd5YKxpEfaLGMPESPhoFm5OfFzSgx3xYEb/OfaWEIFFi++d3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779727369; c=relaxed/simple;
	bh=nNMX0r52iXD5q0YzE2K8/63rE+wmM6rfQbTC8xHdIE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dUQPPq2KG+vKfEehWqCH9mB3JuCk/viuvfEzI8eKPSzuRRYkPR0jrklBu7BrpWYGo0IpYXbswlgnqMEDzlMAqSo8niplBpO5CcfeJQO8+wwl5Aa8DfwxpnztIF8ObObdF5BZrmsVQFd4xk+RUDe9hUH7XqqaEsqblieTBMrvsq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HZ4LR5Kk; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HZ4LR5Kk"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BE89D27171;
	Mon, 25 May 2026 18:42:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEVQqbO9kel7; Mon, 25 May 2026 18:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779727365; bh=nNMX0r52iXD5q0YzE2K8/63rE+wmM6rfQbTC8xHdIE8=;
	h=From:To:Cc:Subject:Date;
	b=HZ4LR5KkdMebppz5VHocasrJtT4+D1X/NaRhwlcWhjcPfZ3/PvAd5wOV8mThWiOut
	 fxvoyHy0LPy8/Nz6gRMFiobwqS91mgi4wcpq3S1WK83Yaa01oGEEt5jBOJRTQnl5C1
	 4xsvTyabXnjlFcnjBRn1dYdxTUvvl5/OeK8GkwI9oWJfcbAOOjHwr/RMEjBo8mBJEM
	 e36ylwIUeLl8XpbLesxNL3S54q1z6NYl+ifnf3nRKcZO9DhtQVPzvzk7LFViF+aHpS
	 8MY5n5Vfx7y0GSSHXDHh6eaYfE3hoOCyiLhZcbeXFTsWudMmbd7DOSFug30i/R972o
	 5wyWw7y8jrlzg==
From: "Marco Scardovi (scardracs)" <scardracs@disroot.org>
To: linusw@kernel.org,
	brgl@kernel.org,
	heiko@sntech.de
Cc: linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <scardracs@disroot.org>
Subject: [PATCH 0/2] gpio: rockchip: fix resource leaks and teardown bugs
Date: Mon, 25 May 2026 18:39:37 +0200
Message-ID: <20260525164230.43307-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several resource leaks and teardown issues in the
rockchip gpio driver probe error paths and remove() callback.

The patches included in this series:
1. Convert the main clock (bank->clk) to use devm_clk_get_enabled(),
   simplifying the code and fixing an existing clk_put() leak.
2. Fix several teardown bugs and resource leaks:
   - Fix a reference leak for the debounce clock (bank->db_clk)
     by properly releasing it with a devm action.
   - Fix a potential kernel panic on module unload by unregistering the
     chained IRQ handler (rockchip_irq_demux) in the remove() callback.
   - Fix an IRQ domain and generic chip memory leak by calling
     irq_domain_remove() during module unload.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>


Marco Scardovi (scardracs) (2):
  gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
  gpio: rockchip: fix teardown bugs and resource leaks

 drivers/gpio/gpio-rockchip.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.54.0

