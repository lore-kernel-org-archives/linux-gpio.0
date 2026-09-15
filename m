Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C39472084
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465693; cv=none; b=S8SgKclCt8p0Oa1ltyMmeYYWLsYks8YGRchRaLTpuM8oCoIAz6+pM24rKSLGhP9g8tQkoXThhH+YBRfq1p12n2vEJxXiRovVL0AwUZSYe8KcjVeS7cuafxkTrRpTkc4TWfeitWFXLwSumHGK7Si5XFO4STQkGz8HJTxp66Lyr6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465693; c=relaxed/simple;
	bh=HZN3yQ3D8C+xmiTVrn1dKsDUwg959LGEcbac8ukezuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhelqxLJw5HZthIHWiEMuAObcdbeGrK9KH2UUJ0mw7y2CE7OpXAn+2iKesixpvoS2nEmKDasVRg9BTNUHr3E7GMZfyyUyGtYzTcH5XBwKHrvc8GTRTSP7Q8YA55N1PLctl8VB/07PlfVAlbYAHmINZ49XIA1nN6fHgi742mgobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAghSrH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAghSrH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26DB1F00898
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465692;
	bh=sFZ9XQJEnkU0vph7WqeYJ+0/ymyH2OfoLkAzsT8D1tA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CAghSrH6UpqKQkU7Gbu1SFaxygO7usBkUTH5a8f5+i0G9k2YGGYk+OXTKZK7C3Hhw
	 D7OIB73rorbPYEvh4sUsIbIzS4jistsIrG8mZgvKcQwNgnFyij4aNo8dlaU85Bu8/b
	 5DHd/MMI+45IjQSPJV5CkE3HqF3GiTPoLpf/swSQUU6Q7EkWkMtFAnRd2ZB19ev6nk
	 F1zU+A0TFq0Q0nlt63bXqfxfHA6RVTgtrdTK9C05oHZwXnmkImOtFzve942QpU3yer
	 UlxKVdLjxDJKennFHKRo08jbyI7AE5RJRBPkwMZHecP3baiklYoOsajJKSq43e+ekj
	 IiC5ZmhFJu8Lw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1651cso2540175e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 02:48:11 -0700 (PDT)
X-Gm-Message-State: AFuF++mnYuJ1afYYvjT3tjxkL3tF56LvFrDv232P8LBc67KK6BNJ02Cz
	nN7AL/mKoJ7PLxE93yHcioWiE0G93dS+svkPD+EifG0jDgdMFNVXq0wv4Fk9P/BDbw9l4v8Jrmu
	N3hIjrIVnLlv40jssdxoTRYE8L2Ljlxc=
X-Received: by 2002:a05:6512:3c9b:b0:5b6:4ae:3ff6 with SMTP id
 2adb3069b0e04-5b8ae6980edmr1733821e87.30.1789465690732; Tue, 15 Sep 2026
 02:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de> <20260915092046.931449-2-alban.bedel@lht.dlh.de>
In-Reply-To: <20260915092046.931449-2-alban.bedel@lht.dlh.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 15 Sep 2026 11:47:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLnPMjSb-GVFQCpjS+c0C+kD19Y7VOQBNKBMgSFJzzMSaA@mail.gmail.com>
X-Gm-Features: AcwNN1V7mkbdm9V4d7k1F7sFkKNQ7HlI_Wp3oisWcbmP0DYj6qLSMnd_Dd8kkG8
Message-ID: <CAD++jLnPMjSb-GVFQCpjS+c0C+kD19Y7VOQBNKBMgSFJzzMSaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add CAT9532 GPIO
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alban,

another thing!

The second patch says that the 9532 is an exclusively (?)
open drain GPIO controller.

In that case, the example here should show a consumer
using the open drain flag with a comment stating that
the driver can only provide open drain GPIOs so all
consumers must set this flag.

#include <dt-bindings/gpio/gpio.h>

consumer {
    gpios = <&gpio 5 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
};

Yours,
Linus Walleij
