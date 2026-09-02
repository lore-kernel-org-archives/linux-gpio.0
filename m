Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F18B37A847
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378040; cv=pass; b=RUTYNbxEQ9KlO2sjccNNiITugQw1U8VZ2RUEka+9xR78N11YzOIjN2N9H0l1XFRVieCjBAAP8gk+cDgVfOmoXw74H+LQ4OmnwTBUf9IrjHeZ4uvmLRlsSAF7Go94kkqn6cc2KkiLkxmuKswNQ1fhlW9sE1mD9oGD9cGXq9p8zaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378040; c=relaxed/simple;
	bh=eLHTLx0sDJsJ3UdAPIBmpFXK0Itit+qS5fZpvv0jeas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThQC2bJmeAcN3OYsttvhbQ9oMssBx06VqYdQDR8PSFeB77X8S/juBqKdrd5G+MdvfGHGgnkrc2HKYcVRKLmytoKWcGRomA1M2HaUWolisKwBOl8TKgAWd0IAX2OFmeesIap/bYQVePwUAAEBo8ob0OiV2ZpGNaG/dzRUD69ByGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUWb/IbW; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUWb/IbW"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c259e5c22ffso244435566b.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 12:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788378028; cv=none;
        d=google.com; s=arc-20260327;
        b=ZT/FWpR71DLlsqLJmlUTwsIGmsLbeEFEP7WXT0SJ7JHWQge4sZszc7BBdnJB1Z/gV+
         H294EMRcFi6QncTPY9/lFG/SLfrrfiXJ6ruQuSuLDTg+SQTzQwLhs5gEBP6yILirjWyN
         fBMVATHq/Coc/8LqN3VrXJDX+cKbc1uko4ml5eZytThv/h914noFXMMoygTF/zwLMoBd
         B/ANOs3Wyuoa2yt6NEt9er52Eu2wXEfg2tSpf4HkjFudZBqcNkSSvT3pXRuxa5/8H8N3
         CA82NkM/duTY9sUdC3WZhMH2BVDeXK17LRbJrOKftNp8SSGmB6f+wrGEhw6qrqoZEhFd
         rpsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        fh=trtKr9Ql0dmAMmkKtQoP/bWCLxLR5IL9bMlAxfgcL74=;
        b=PusTwQUVum1b826emG+SBCLJ8fuNYwUMO/D0Sgtk/M1XGVLDIA/xX3jEt/I9+EA9q4
         L1ANJjtRdRezenSX8HpV1SzatK8OiHbYK2iq3YgJc1621uRua40ARm0VfmZRNd/Ved4O
         1dG212tIFd5rmFTICw2+8mNV4Nd6EpldSDQXhfE5CmoV0kSqHpropmXjUpQCtO6Y6aaV
         Zs24Ek7sryQnjJFmkFcxB9G09Fto28dMjGMqdk4FIZrCmKYiopnzvg4QND7DyDXlrwec
         6IfRlPwKHSi/e9igGO6tldtZAAWoOJqj1YQLXcZYmyKG264mWjKljdEFoH1PUGGZXTlt
         CBCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788378028; x=1788982828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=RUWb/IbWnwRrHbpmkQ/geuHNzbmDZM3cbIFwkfhuVSlkzDe9K+TllRV9sa1zWSFFNs
         P3UEISuLLof4pQVZAJksf7DH0AF2dwvAhkVTxtsCHL69q9dGK1yGxrjV89XvNvcLbc8m
         BqOrHpBBJttj8/slVhrpqfoXgq3JnYrl9wRfF1IvH93PMsBNKVxTqg9Lw/MoDl4YjSST
         WpmBUs8pxfEhgA1UaWwT/3P7AXVuaTtrPumsRcCwNtWxsv1UH5u5Ez+omICA2H14FPdm
         aU8Ee3Gi7M3UfMH3RZa+aoQQrTL0LbBcJBfLlPI1DdLYXaw/ofFUs/TXgvK/a5X6VzOl
         QgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378028; x=1788982828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqbOVEuyYxeSD2DntBhPNO5j8MUT5Vkh/1ohb7qF7PQ=;
        b=PD4v0wCF2F7aD3cFZr/9kdVftUc07oklR9GDUH/oLiwEHPKMezgN8XzQgsclV2cxAZ
         q6Bjc2LpjjXIZikpMO8FYdZlP+l7VzRevhl5oV/hm4E2klCJ6+VxweZAh0qQZOS0K6Jf
         CYF4kra205NUHCTcVvHJ+po2p2w4NHl/mxONlj+Shz+u6rvE5Qst6Sbn8qUtTMMen5UV
         IR/hkexuiH8b5frgnHImCXZklSRPfs3KbsgJejrK55+/HX7XzXDqYJMBo1cPw9C9QsWv
         rMmrQXowUqiIzbgOJKYb+diJ1dch2mQzYNwhC0yeq5KFwnJzxx2FuuGpn4O+YlIxcBMI
         HLMg==
X-Forwarded-Encrypted: i=1; AKwUvBz1zmQpv6jV6LwPdew11bozlhbZ15H53wBJ9WPmAFNbXjZ216bKMHWsbo1/L+Vf1Sf1uDNgzYvTuj5Y@vger.kernel.org
X-Gm-Message-State: AFuF++m78kejt5GTZXfdvac1oFLtEMe9xd93DtWu5dUhaqgqTromtlN+
	Y/4PSV/HErYpW9882KcJ+7RsHCsJkUswoj1uyGm/j4CakHX7qodEetbx7/y62XJJOwoBlbBoGOx
	/HEB1tw/oM42i8k55CDqKBG6jwqyopgw=
X-Gm-Gg: AYBFou0C7BM0OzZeKNIhbpj96ORQyTE/g/Hpq4LPPDGnc1CzX+elQ07cwWl/HVOP/mK
	PQs2CVzd2vO0re3yD9fs3kwVwbN4dRffJ7yvF3guIT371uaS1+mQCcXyiSQ1mC5LDTk8+2xlzSy
	xhgkMd2HohAE/yFgKu61AUQZ61WT5PhbJqq/7dT4i97jO9oC1fRbAH4lFJX+qnst+QyAJj45NDD
	8Icvwuzio+fF43FQ1V0nEJomGrGSgILbsfhKZ8ytI4Q8FGHHk8gkbZf0QzO9r7zmnYismdA6/ro
	ivmwUc8hqJL+pGHC5+eLv/eTpeEmKKs6uwLjxWt16qk=
X-Received: by 2002:a17:906:6a06:b0:c25:88e2:fe25 with SMTP id
 a640c23a62f3a-c25d53cd18bmr358830066b.7.1788378027879; Wed, 02 Sep 2026
 12:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260902154616.GA2133376@google.com>
In-Reply-To: <20260902154616.GA2133376@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 2 Sep 2026 21:40:16 +0200
X-Gm-Features: AcwNN1Ue5U8Nrt8IK2CbOEno4dpAA-gcYG8T0qYRXxkQ6nYlNe8G_uXeI7qiNIw
Message-ID: <CAORyz2Kt=rKSJW0Q9pFJiBsa6nPGhHdNrsTsHcE4Qxpq5RsSaA@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What Acks are you waiting on?

Hi, I did not get any Ack for the regulator driver and for the mt6392
dtsi yet (patch #8 and #9).
I just submitted a slightly revised v10 [1] with an improvement to the
main mfd binding, so I think it would be better to "renew" the Ack for
that too.

Thank you!

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-1-l.scorcia@gmail.com/T/#t
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
