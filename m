Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F243D1DDA18
	for <linux-gpio@vger.kernel.org>; Sun,  4 Oct 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791114503; cv=pass; b=YYJgguGKbw7DvUXQ5tjpWjz3RwAtVldHvH7yW8fURk8xftj1abQWiJkxg9HUu4HhHYz174zZ0zTfCPE/cMt3nRPWmeH/JiR7d70WvXXqPkA0n3t0JIYpJ89PhHtAaq7UUDzhjNHo3nC92akFy3dU4JIULEzP+PI4jUyJJZhhroU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791114503; c=relaxed/simple;
	bh=6Hw2NBI5oBmYGaSdg+LhYtXlcykEa6H15MCDv/gdQbQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hdPylfqGmcBDmNjrlddckGrtMeRmD2WI1DXQqhv6PjpF10Ajdje6Tmm2YcExph4euzwjwrmfYD/mhMlEVw9QgN7+kZ4UJXA2CysiMqT1hWJYWE7hASJGw1sK8l3WBF/JseUlQHgCYydr4SKKXA24bko+33trQNkNrC9GAV/ghYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4j8CBuo; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4j8CBuo"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8ac8e048735so4190777b3.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Oct 2026 04:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791114501; cv=none;
        d=google.com; s=arc-20260327;
        b=BbzuSOztMLz3FefjA9m9hrszWPmizkNJQZZfzK6U+FQu3tufulKXRc5jH/NFTLdoBH
         94E5R7/i5K3l554zysYztr2eAvguMwqtJbphBHjwZL4VRGIAV4JJjfVPnsKG1Anda6Vj
         00YXtcVxSsU6pek3CmtJFuzugut2gd06epHhX8ho6Ln37eCbITe8tSfxlyN+Q2t2gk2u
         McKVPokb9GJhQD/aCk+O1kWVeym/eWTbHNQPH/AqNP+kJRCLMKygrzK77BydUrzXaXPc
         stVHvpStbTPEWUp5B+utEt0nFPUQkn8sgBqqlFLtmWTATjBOqqac2hQttWXgDpCRNzoG
         gnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xEcFNNOjf+xrJu4jjq23drU/TN14HXtXueDl9+2Vlg0=;
        fh=kMesN7sU8WnhiIlH8IS9bp+CndEEOy/DXrQPBiHkXZc=;
        b=ZrutlJE+Dr5LQ/eST7hQMfQyvWNK9ryFimMq0JrI7ms9eXeQBE5RqJjjBuDgn+BIlE
         ZL15ftMUJoHoiWKH/Op4xQuPVIB415b5R3GN3/3fNkBCKoKX8w+uCPM6LHRDmxIkp0t0
         gJ4KjQvk2/qQjjrn3LcmrJGTcP04m5LlLfshpeHKnML93D/Dh6HrFQW6oLXmmF3KX25a
         KAZh80zAr1M0EATEqQu5z6PRpHMPCxWmtYH0J/Yzfy57rZBFyDqz21v5FrxY1f03xjuW
         n/r1dYQ3VnvSTMvZF25CfdfWkmDzOD+wEABzh/VuJDCl9VgCzBZbA8swSlz/5OGLXmrf
         J9uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791114501; x=1791719301; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xEcFNNOjf+xrJu4jjq23drU/TN14HXtXueDl9+2Vlg0=;
        b=p4j8CBuo3apTubI3I2BUXKQj6YmJGrg7Cwb+ysHne2X35mbIYSVFPT0h9+v0+5PndZ
         oUUZ8UMYeXDws97PskPnbcEe8EzSRJvY6eHteth1JHg9xRXbD/JAdbmv+Ho+B4BMkRQC
         Vhh0u44xsH7BE3ubKxDUzeCbc87UTUMGgHZX+5jp9q/cs+sAHgTH2UA/4JqUoLsQ6OPd
         nWLT4c6YOB5TJs3RbrQ7mzTk8atB4aztlcFZnVKZqvXUyemSjkYzOfL6c1PSwvVP58Hc
         oAfxLfLg4v+SsFjoS89WDDE367OXLoTLjamkIYUDotqb1MOASTLEAX+taPsu1Bie/jeG
         DGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791114501; x=1791719301;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xEcFNNOjf+xrJu4jjq23drU/TN14HXtXueDl9+2Vlg0=;
        b=11uRz7zjFbPeZxtEAV3KvJONOm9tHsjhF/xgIwoN4ehPLUElrRBCeAPMiY70TcrM98
         UmHilb4RnzyGmVaOsoLV796Rkh57vT2v4ZCc3cRqkaWRSUVY+NE/Er/5isL7RvnfpvIk
         p2KbbgXVZ36dMjxLNaUUN3CiMjlB9btarVxg6jF7+iBXnVQajfveZI/zSqPWG1UdUQug
         HjwvxmtRofBYZjueufdwQmLdFP/8TIBtV9UD09GyAFJ34+rhEFmfkSU1cpXJ9jdojHTN
         lMJ4/mcwRrvJkwG0l1YZ3lRC53mHZ8IIT9na4Td6ry5Lng/S2CHTymzK0aFi6r5xx7vK
         QnIA==
X-Forwarded-Encrypted: i=1; AKwUvByH/Am8nLyhMD9Q8FkCpcMPcRh1z/9J/tT42fbQh0coVD4I3Zit56JYIecgDO1Vw4Msv99JplqZvpXe@vger.kernel.org
X-Gm-Message-State: AFq9FYLdtqX9PlQ2IOY8J2GNN3oYTCbzkAhEvYlkt3s5C7f0jsgzUxjc
	6o9Q9Pb7E7xkWg8hFIdF1Jwj/z1zFYMNFlzNlZqjcImFAt6G31UWgKtxqdelNmXBtOWm8f49JYC
	YSqcZCAV2KQH6bwBbuQYAP0j7CaiPx10F+3+i
X-Gm-Gg: AYBFou3gBykHuwsdqrapGEn7LaJXYGd0Am6XwH7hYLqWLSfwbWOYA+/5OwxFQpTdcG3
	pET/X+sCXQkZgc5UBe2SOhW8+C28NxSP5pBqYyp/wiq9C1Mz9E2zduoaP0bzo6rG1grlXQRP0Zq
	jIV8DUVt0D5TGgUt/0zEtlC35LIJgtWaGhGNeuQ/YmhpMfNDfi2+UNzOHpsdIU4kmawL0H1q73N
	f0/HjtqfnoqlNYnBltbaZo8jOcHeJnWVPZh+wRXceIGsoZK+T3byLqPp2ZQAbAu722pvJhLIYTO
	6cCpMeddZMf7hfmxYrryhzGDPMyg/X0DSPge1E/6WC3yHfIwZFQCfFCUt3dkWg0XGCBH
X-Received: by 2002:a05:690c:9990:b0:8ae:17ba:df03 with SMTP id
 00721157ae682-8ae3add6500mr24577497b3.64.1791114500851; Sun, 04 Oct 2026
 04:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sun, 4 Oct 2026 17:18:09 +0530
X-Gm-Features: AclHuK--qH85BIZtoMJyg3lILYRB1sLcVJWp98pczpJ8Wky3hLgnsWW47W5LklQ
Message-ID: <CAMFFDGja4JnRHAUQTLHAStZbYM0GyKWVDAOFENCyrVc3AmV3Hg@mail.gmail.com>
Subject: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through and gpiolib ownership
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"

Hello,
-> I am investigating host power control on the ASRock Rack B650D4U,
which uses AST2600 GPIOP3 (GPIO123) as the host power output.
-> Vendor firmware enables SCU4BC bits 27:26 (the existing THRU1
function) around the host power pulse:
  SCU4BC: 0x02000000 -> 0x0e000000
  changed bits: 27:26
  GPIO123: high -> short low pulse -> high
-> The upstream THRU1 pinctrl group claims GPIOP2/P3, so selecting it
statically prevents x86-power-control from requesting GPIO122/123.
Without THRU1, x86-power-control can pulse GPIO123, but the host power
circuit does not respond.
-> What is the preferred upstream representation for an AST2600 GPIO
pass-through pair that must remain controllable through gpiolib? Would
a generic Aspeed pinctrl/GPIO extension be appropriate, with a
documented DT property identifying the pass-through pair?
-> I am not proposing a board-specific sysfs interface or direct
userspace SCU register access. I would appreciate guidance on the
correct kernel ownership and pinctrl model before preparing an
implementation.
-> The AST2600 datasheet defines GPIOP2 -> GPIOP3 as a hardware
pass-through pair. In pass-through mode the BMC cannot control the
output value. The B650D4U vendor firmware changes SCU4BC[27:26]
dynamically around host power control.
-> Static THRU1 pinctrl claims GPIO122/123 and breaks gpiolib.
Ordinary GPIO mode allows the pulse but does not route it to the host
circuit.
-> What is the preferred upstream representation for dynamically
switching this AST2600 pass-through pair while retaining GPIO
ownership?

Regards,
Prasanth Kumar Padarthi
