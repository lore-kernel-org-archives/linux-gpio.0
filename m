Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8E12B94
	for <linux-gpio@vger.kernel.org>; Sun,  4 Oct 2026 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092912; cv=none; b=B+Y98qgu/M9CIJvVFDtUQ/nLLshcOjbMIrl47pfVNwyfJZMD+Dsqtjzc1uMGMLiKKVpI+ZFz1If7lm82A+vY1wEqj0uNAIsGA6oOK3gpSxErEANC2THxIynGwQRyWeNcScQOrF1CI1n2gtiNk4Du8G0olY5kO3bhaqTaaaBHXGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092912; c=relaxed/simple;
	bh=kA/0ZRcsInKEz1O5HLXQCbexw69M1ReXszXBjKEpfzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kJy/BXaaDrYUv28Msqfo5cvxcisiaB2Ca8Mqs8CFSz/290Rcnv3JNCQ2tjY+0d0ZryfQqUY8qG1LXz0IZv1Whv4lrNX3zYwAQhwOdjnHNYxDgBDVNO8xPxV8ziKdthv5GJUGkmlA01E9IfYW4t+xoyLCbVdDaJouskTXWcnJs2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ft7N4p2F; arc=none smtp.client-ip=91.218.175.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ft7N4p2F"
X-Envelope-To: linux-gpio@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kA/0ZRcsInKEz1O5HLXQCbexw69M1ReXszXBjKEpfzM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791092907; v=1; x=1791697707;
 b=ft7N4p2F0eMJdPReAvsSm5Lta3lnFPtARYO0h/Mvqhin5IYX9lNgYPoLjpga69KTdU20dlZs
 9soBZsL3P0yHSIwUXYTiPj938yozmKQOYdPdGfOVkUDUAXvYgL1xLjWRLmiTFIALKZBqbPNN04L
 1Kg49EsLIcyYkBsEYMIKxcNQ=
X-Envelope-To: linux-gpio@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ae07ef5e9ef0dcf3;
	Sun, 04 Oct 2026 05:48:17 +0000
X-Mizu-Trace-ID: ae07ef5e9ef0dcf3
X-Migadu-Flow: FLOW_OUT
From: Junjie Cao <junjie.cao@linux.dev>
To: andriy.shevchenko@linux.intel.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	ptyser@xes-inc.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	junjie.cao@linux.dev
Subject: Re: [PATCH v1 3/5] gpio: Move Intel PCH type of GPIO drivers to the intel subfolder
Date: Sun,  4 Oct 2026 05:48:09 +0000
Message-ID: <20261004054809.24211-1-junjie.cao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925160913.1648565-4-andriy.shevchenko@linux.intel.com>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com> <20260925160913.1648565-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

One small note: moving GPIO_ICH under "if PCI"
also excludes its existing COMPILE_TEST &&
HAS_IOPORT path when PCI=n.

I checked that gpio-ich.o builds with W=1 in that
configuration before the move. Could we keep
GPIO_ICH outside the PCI conditional to preserve
that coverage?

Thanks,
Junjie
