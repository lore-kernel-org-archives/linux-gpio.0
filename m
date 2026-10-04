Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF6C19C553
	for <linux-gpio@vger.kernel.org>; Sun,  4 Oct 2026 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109139; cv=pass; b=tYJ+iFWqJNwNwmjP+JIBfLxRK6niaawSkToC1f3FP6mnujKlsyYrcb5D4mg/9yo3HtBnc+pI0Xshw0OpHjDs+n1ZDgfndeAIpv1Aah0PAJLHTw7lmf/tZnzTep2zlUigtJZazpSCdOGyhKJ2eIjh4PqZsuCxRE/FM8Gbx5q4BRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109139; c=relaxed/simple;
	bh=DXsWTdz3qf+j+Nx8BpoDHTiW3fmhzA0PEyjvWM1tavQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DxpNH2fe8vGC/t2pIvm4wmW+WOjaUdWblyw/tyM7jeh81IGi2lU+hhDmNj65kdnlrlRx+Rk0E6b9BaH5f87IgZU77GvYb/VjMzyeYbDp41EK56qAjmIDV5sKUfab411YBVsORBRyfNqwW+dIqvkVOz0kCnOqpUicii3pX1gOFUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKs8rsk9; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKs8rsk9"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67124ad7615so521527d50.0
        for <linux-gpio@vger.kernel.org>; Sun, 04 Oct 2026 03:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791109137; cv=none;
        d=google.com; s=arc-20260327;
        b=cZgIYy+B5vBhiIp49Nr+m/Yqrvo3zVfkM/2o5sKlJVK+Tq+KqDqX3xC6RdWAs8T85h
         a3yx6jpyEDy5EmbH0HPMt9kFVYMDf06G3MdWIi/2oM5GjIlK5yfTqKg21XYnPzPKjdhX
         Pk/+dkC5fyaJlk65MjpCElO6eIWt7vacSzAzihFjQLrO6UV1Xe3oQVpBuQpeGTFD7yfP
         qERVNuRnbSXvvGdyLptH6sddRern4MPROISer1Bxo+kswk8vtE4rlKQpxbDr5dxCFkO0
         730Wxl8GAEFAasrugoU7bXI7KH3NqTcdwNpWpiWC9QWffobZGcJiYWQwugLpudaPZT6s
         ZKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FHDLRTWsqm1v2sDVxXhUANWcv5ddv3GsR8vXFn0sF4o=;
        fh=lVVxIhcg910P72ZwhPL2jn8g3WLnILGseJebT/Oalig=;
        b=KGnqkbHf9aW0hzY7bfedTwUxUnx5JqP3ylwHQWl8EFrSoMVBvIM9nNu2yVMMYOpX/2
         N6KypSTvO3peOdVY5SnAMYaxutkaPUJu7sdYB5pu6plGKHpj5+0Kpz5mc3P+ZViheUQe
         oF4KvwZapOPIS7cxLPbIj3huEL/i8FjFjQEaRZpYd+N9hL6RKC1slSTjRoKcIPW02N9A
         /8Qvd3gCa3uhd4yswwY/yDZg52u0G9M9mm07dxT3EO4wfLaeZ/FOaMpgyiDmubf+DPDo
         UntB8+A+LNBa2gFBHc+2tCG984F8qQsR+PMH/Z8OgKhEbz8d5cmi3RB3TVUCWsNohLxv
         KmKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791109137; x=1791713937; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHDLRTWsqm1v2sDVxXhUANWcv5ddv3GsR8vXFn0sF4o=;
        b=IKs8rsk9va1doNVjKNJEGrHxK111MWmuQv6c6o1B1UG4tTtJ5Rfk7EXbHz2GtK+El8
         IpqOPqMsg4mKnYk+/nTcxRaEXlJgrn7H9Ywa/KxEzY8eAhy0ChjoQ9viOnx7ldhH3uez
         ur5YU88CrBb0mDAGmeZjjeHjOE+hsZswXNBcoJn0i6VkZiAXJSg/9Znpk/103lT2+U2X
         /KY52876Bo/17HnwZTIlvkrl13s4LTfavHxfxDieJOyDp+X1hePthSLwoDqTbqgIKbG8
         15pP2hE6NXTjXNUsUD1qwPva0jaw6JWjQSNqI9WWz6nfNLER5UDXoKZWRvpyJ9PNsiK9
         4ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791109137; x=1791713937;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FHDLRTWsqm1v2sDVxXhUANWcv5ddv3GsR8vXFn0sF4o=;
        b=P2gCsGv1TZn+xiN3bKz4L6zaNwFqFS9PplchCiNnP9axtKFtlBi8cQtpXfpwwmTkPv
         Tb7dQjhtvxWubc2JHt7IeKMNE56VtZ0TXdp36wMjKKxMGFACOh6PEVpVl+n5GWCOAsTk
         XFVGkmRUkZwJSzPsv6wOxNiorkkrrmzACw35vXz9P4inkEcyWAlN7AH7HgUs3N+8mV5j
         Tx2I7RWZT4VOzuH4SLxGkABqbIooVVU/jJDHVxeiEuBk/DDewCFjEhAPx3OXJivMCMkg
         d5liyt8ul5l4MJR/psT73MKhLWXuPXb1w5DNlFrWCriZiKoQJhf3/4EardJbIWvYS0JI
         mpTw==
X-Forwarded-Encrypted: i=1; AKwUvBw3Ywo9qRyCMp55pAnT+Hp7iaPvhyBNXE4hygfK/CF2Q5ZY1eR7hs2Vyt6CT60FyUgd3wtWCXfnC6TN@vger.kernel.org
X-Gm-Message-State: AFq9FYLKuMAB6vwuGQNKDO2LFTps0+jwt6eTzlpyaRK05rtOLNQd4m1M
	5o4ncBysW3jGCMVUr46+Y731mw8V8ohPGIu0NVfQF+nyHegpwWD1TE0+YcbH2E/MS2EUCugzjKC
	aOCLecSNekWlFxiy6zxcdqazsT8+YfPY=
X-Gm-Gg: AYBFou3N7C9MZdP5huvU/yuDXMMblD2va/b7R4fICzsfkwOnfkclXaYq0wx8hhtlQgf
	bs5Dyq4PRJKZ8T+BPV5TYdoenEcELpgM3vovEGmfC0ZxsqhyvE7ui/4WZks1ssThDbxcPbdyZpG
	GgdeZHDY42DQwGnR8JujPqx5BwCSIsKj0jrCqllV8krMwpnVf4bLf3JAdvZhNmj3EgLXaCEGp0X
	gFP2HPjSWZ7Eu4zv9Rv8JTaH2R5O+XQqFDv595ToN2I6OVseu9Ln0/lG3ulvwB8xWGqyimt1plw
	aTqTYcDrbeFU+ZteQ39t8DgwcTzU6fsbBeDNaCBcmZo+qKxV1bRsqhaV9KMQwxHH45r6
X-Received: by 2002:a05:690c:e285:b0:8ac:805b:3a6e with SMTP id
 00721157ae682-8ae94ca3034mr9201637b3.25.1791109137685; Sun, 04 Oct 2026
 03:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sun, 4 Oct 2026 15:48:46 +0530
X-Gm-Features: AclHuK8uC53IfbueYoLt9cYxf1WxTPbz_S-0lUvFuzF6RUcIgmXBS_Cylz29aks
Message-ID: <CAMFFDGh6XwYD-axu3brX0Tdt3PteJHHGo6oJaghzpvnEyzT58g@mail.gmail.com>
Subject: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I am investigating host power control on the ASRock Rack B650D4U,
which uses AST2600 GPIOP3 (GPIO123) as the host power output.

Vendor firmware enables SCU4BC bits 27:26 (the existing THRU1
function) around the host power pulse:

  SCU4BC: 0x02000000 -> 0x0e000000
  changed bits: 27:26
  GPIO123: high -> short low pulse -> high

The upstream THRU1 pinctrl group claims GPIOP2/P3, so selecting it
statically prevents x86-power-control from requesting GPIO122/123.
Without THRU1, x86-power-control can pulse GPIO123, but the host power
circuit does not respond.

What is the preferred upstream representation for an AST2600
GPIO pass-through pair that must remain controllable through gpiolib?
Would a generic Aspeed pinctrl/GPIO extension be appropriate, with a
documented DT property identifying the pass-through pair?

I am not proposing a board-specific sysfs interface or direct userspace
SCU register access. I would appreciate guidance on the correct kernel
ownership and pinctrl model before preparing an implementation.

Regards,
Prasanth Kumar Padarthi
