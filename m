Received: from mta1.migadu.com (out-205.mta1.migadu.com [95.215.58.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F653B28D
	for <linux-gpio@vger.kernel.org>; Sun,  6 Sep 2026 19:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788721529; cv=none; b=evD3kiHsmqqxRTxSE64s48AtpLOWyURCj5f97nwdc+oXJMko7XTYSuemR1ucFU4p3Zhhr4/kaFzWpNzLpjjYNQ0qfzTlkDVFtjaIbErHg39MAuKefXDS6+op5UVW9sTRONn0Me7zfuCtct0+7f0XH5QkA75ed8mDj2tqG0uoUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788721529; c=relaxed/simple;
	bh=OsEn4MpjN7QcUwJVnLb+VhWWm2a+Oe9um/I9Q4NnH48=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc; b=OEjYv7DsmK/XVDYGLvqCvwQ2gyz/IrQlnXoUjcZYDTQ8cCcvLcYX9izM5GBMnafclwavEDg2nm7/iwssEKWX7NtOcVWvgCPRul40EsNvSrARPBcpMST9bjQy1eZncekvbgYeZcKm7JbFY0il73fZ566bkQ8zLLEBafZrZBtGGPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A43S+m1i; arc=none smtp.client-ip=95.215.58.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A43S+m1i"
X-Envelope-To: linux-gpio@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OsEn4MpjN7QcUwJVnLb+VhWWm2a+Oe9um/I9Q4NnH48=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788721524; v=1; x=1789326324;
 b=A43S+m1ivLV+uRShkuS/HYDaxFeyN/9HOjmIMQmAdE5mCC4JFmeIiUkHxkIYq4KemuHnZ3Kb
 8UZsNqphyUkKIwBzNt0Nipy5cokwo37ReEQ2S2HGJHe8DqGy3vfPknsyvg9yuH7B/Y5RgZBB6jN
 pIJ0S+smphpfN7QFYQ30PvJg=
X-Envelope-To: linux-gpio@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e96b81abdc3c11c;
	Sun, 06 Sep 2026 19:05:10 +0000
X-Mizu-Trace-ID: 7e96b81abdc3c11c
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 19:05:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <55267dce42a63e5210c34e49747f564f5cc0b0cf@linux.dev>
TLS-Required: No
Subject: gpio-hog names
To: "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Until v7.0, GPIO hogs inherited the DT node name when no line-name
property was specified. This was implemented as a fallback in
of_parse_own_gpio().

Commit d1d564ec4992 ("gpio: move hogs into GPIO core") moved hog parsing
into the GPIO core and removed this fallback.

Consequently, GPIO hogs without a line-name property are now displayed
with a ? in /sys/kernel/debug/gpio.

Is this an intentional change, or should the fallback to the DT node name
be retained?

regards Frank
