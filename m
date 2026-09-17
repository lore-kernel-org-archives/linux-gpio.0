Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD33A496D3F
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638999; cv=none; b=rlZ/wFUhi8udaXgs3Y8ABo39RHEJJb7Lwe906AswDfPLEBgTD8j7DkcR6Tez7FWp7eXs6gdPxIvvt61sz5Y/sNdyk10sEaJSPU3XQ73p7E0wROiP5jnh8TobyqfZ0DmJHaKgqSJpedcXSzeNVh6FEu5UtBIkl6THrmDGiXJh+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638999; c=relaxed/simple;
	bh=vNfsDwKYooX0vfo3ekVZN/TR/vUknbQ5hnS58EH0DzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7kNlcREzlxI/TmM5myQ5lICpAxegYqnTuiLy/JARFTfjW1rsvnOPg+77uIwIQG6Q0F22m1SCBO5xUDRgXazwbRVVEHq0YGZ/IiioERSIpeRoeuq6zFjfdGxQ5oRlJ7IGJoJm9LfHlUKhAiO4c4dpdo4pd8SGJz1uSxzx+8H+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZpoQXyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQtyLRJk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZpoQXyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQtyLRJk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zssr4186763
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=; b=GZpoQXyI2GpLiLMg
	roUYsDFcANMLND2W+ZZrZlUd4vvKdQjHhPCmJVbG6eg42N4yRfKFzafb+L05ir7P
	oP3vcD/TJLKO7oM7pRe8gr4AZOrMDoY0ibpp5QtZsNmLmq4lKCTPO1C/yfFcr3MF
	RCzFZ2Vbhm4R7PAVVFcf1Jn9BhMLTNKTaEzIb99/Gsp462wVOSarqHWeH0UzMehx
	LsocdEjcT3fLNgL+BQMWBh4fJ1UHdvn9WqO7FUD4X3822JGPHwDpJIRtJu0uYPRf
	GLH8REmO7enxk8llRl/sy6doZ6eEkL3gbFa9gSdIg94jE3JDcSpnh9f8nT8A1t7L
	e8kIgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc9jj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:56:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a05d645acso137185185a.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638984; x=1790243784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=;
        b=YQtyLRJkuzsxrIj0SkRvDnLU5OReZ/n0zy/V6PWxZkxd9C+L9wpWj/CZf9LSfLSIJB
         INhOdNSyk8s7S7O4OwRIQMyHyiZeJ/j9Pa/YK8tabH34moJRDOvvh4V01b4QtZWwjb7o
         Vey4c4NSjp+9HghkSgJK5nSUrQUoGcmM1rHHb7mXKMTQRujuX+rF33p7ckuFdBfS5t6I
         AqlY8kOnhmCEG+g5OzaICByeIUWmJDcB3WioLq7/PAYDQY3TIySgCEjUvfW9lpbONoHy
         FcAz86WpK0/NTiapwHNEWns31QGrBJXWZBHYrwQ8gMJzu/TgsmvMc2N36HCsuJdfHKDU
         EDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638984; x=1790243784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=;
        b=Tdtge8UR99gPwxHeCvi3R/dlV7MQaDjUh383wQEmqCcc6J8UEtGDBsLIvQsPIlnc5O
         aOsRqFE5AMLdDHnXoJKSduTOqcG7qKpxoKFBQqc/E2cLb154WJe4kTPGciSlzn2Lz5cH
         Mq1FT6aaJYY1oyTFFf0FTs/XlfjuuNHpP2r6vZMEX1LbQ6FuGVkvbSspUpUWIy0pss/C
         k/eOTVKt/VL5+oI/lxhmFafEaLR7geG8IjS4sncDssySQl7MozqLLJmzVf3M2axkbYeg
         SqFejQEJUiVD66wAGmHj1l5MWDrdNfqXUXAIvGG5veDpcReSL3TOm8U7MrW1Hg8hPqRj
         /d4Q==
X-Gm-Message-State: AFuF++lsqXc0Q/I6wKUIaez2g0jXRp7qVLeuYDrjqtdAZGV/TjVqCd77
	PP0Czs+mMZxk+SyNXaLshCWzEbd+8ak47sm0ZLpv7IY6zRYxqIFkkpgK+f8Sd6f6AsLmYZjhNCE
	S5N/gnFHG44Wl0ydptRxMk2UMW2yh7nqSM4b8fQvdFdCDIl1e7pz28aXu8TPLXKYAN2ZvGCb0
X-Gm-Gg: AYBFou1ziztZMjUeoKeMhiC8bUuh1l0Q5CehT4MEy317o3TjlIWv+LxlmhWqW1Dh/kG
	Ek/5Ebk5B0UxV+DlROhDnn8bPL5s8SQa8vgS3ZWVNuZUaIwk7oRg6izNrIbOTtvCyXCSTd8WQa3
	XTOQayrW07SWx8ZzorkX9GHCAwoCJXmlKFkGyyJQW2hf6A1XCdSZPwe7VQUazzGTW2583lrkzIv
	OfJdRHIfzJ82CArxWkiN/zIB+4n0iJLOVbDyOYPSd9b6CB29SIsCE6NVE8EaPB7dkV6hSsrVY+r
	K3EwG5DNUrdClVReOJpniD27tttXoYjnZSB9eunWrCITpdWx7uYtYj68tsvJT5XcwjvC60OaFJa
	SDxHlu8Ay6ovDyxlIza5fg6ng8Dc=
X-Received: by 2002:a05:620a:2547:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93bb7909a8fmr1023013385a.40.1789638984110;
        Thu, 17 Sep 2026 02:56:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93bb7909a8fmr1023011585a.40.1789638983683;
        Thu, 17 Sep 2026 02:56:23 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm99701075e9.10.2026.09.17.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:56:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
Date: Thu, 17 Sep 2026 11:56:20 +0200
Message-ID: <178963897745.8494.17988648370615095613.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
References: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNiBTYWx0ZWRfX7lS2aT7b/e5G
 cAzxFNTeZNUlWxbAYGhDM+U6/sReqfz3ucsNI9XoU7DdCXep9ajKZtAB59uA3GtRX54XPiR8pAm
 q4sFdSUYIuupQbgBXSgV2Ed12ca1nu23QZ2fp10saFShPWNxfC1bpkem6NDgElHasGvN/2Ouds2
 UgPknJ2uXKTZRzaN/E0pejXY+bUlGRgXaiNP22KQ5YnGuMdgIOzL2xI8NZzlzM1gaVRMqbWb2mV
 yugn6x5lA4LR5xtQAxKqlr3oYBIjFJtXVC68ldU6sDgW6PHpUQdCKKgRCpaPeOizTJGAoz09ejw
 TdKCKNK6ObSzv3bmjWpkoDtIMwdqyJVHpDD8A9YDdqqUW8rE9wwB4vx+YImU8y2DUEcwoETn0EL
 YYX76trEh90cDDKtOeJrszMqdeJgQQAkt13e6KsbH8ECKjsbvrBJAXjCu04OcxfLZY8/MKPqbQC
 xM3MvNF6Jo0rE9KBkBg==
X-Proofpoint-GUID: ckH0t_QJpC1y4QMLSe6tNKrbm1POSgc8
X-Proofpoint-ORIG-GUID: ckH0t_QJpC1y4QMLSe6tNKrbm1POSgc8
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabb949 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PEkeK1Ut5SyvuImKavsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNiBTYWx0ZWRfXxjbGccwwyia/
 jsKdXwT0ooJbPZAnvgVZOUO2XQrPFx03RbaPfF2FdJ9Beu/D/riOQAJOw8Lyv1NAxmtexZdtGt+
 PEuiJqiW7hGP+4UugcvAUC4jGIbVC2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170136


On Thu, 17 Sep 2026 05:54:16 +0200, Marek Vasut wrote:
> Document support for the GPIO controller blocks in the
> Renesas R-Car X5H (R8A78000) SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
      https://git.kernel.org/brgl/c/373c23eab4581c653e875257b72dd239fb64b738
[2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
      https://git.kernel.org/brgl/c/79ec1b1b33242fd58865a56c1565be5c1de0e837

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
