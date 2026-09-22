Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB309423A83
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064904; cv=none; b=PYT3Q6HWKQ2/0ImTx4SSLJHIIKRCE7NUsK7IiM4YPvrAJ0LTVe1d/zF976rP1re4rdfp9T+dcv8cWB3L7ZIn66/P5nBztUn//5KYq10uki25AL1lEzShNDA5BsqcQ4VOMn7xwlLPJjnXuDtNcJeqM6QMnZLYZfkRgwMhEVYIU6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064904; c=relaxed/simple;
	bh=QdmMjDMXOUbf3uJAdob1pCjvy+MqJXcO6U0Kewq/5H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUfDWM36sCrHOkCJDl8xQyNt5MuKma9IkQnAlM0He7cquBEJwTduepBeffo5+lphI/4NtAbF6J7wg3ybdyeUs1zcUhKNbnNGq6bHERYZI/wHpzJVQg6Ne4S5nATLjFXuQh2WQKgF7ylHz57e2wpzyZTviLtzZuClq9xU9W5RpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oupMneNz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNHZ2xUe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oupMneNz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNHZ2xUe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M3h69X1842310
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 08:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nUVwl/Cqz9oHS9EDYzWm3E77+kKD/YiQILpCclthFpY=; b=oupMneNzioNcUTOs
	MGAqMOc9eeKi6luGAIoBFRTNYc6i8Na92RGA7mpeup0bIouMmHX3Y3xziZO9nPiH
	2aNVtft2mHjuaCxWclK5HuRc0eHXVCncEMRmIEGMLv6SD7RGkO2wQrFs77FE/MoP
	cq1ATti7Q8q4eLNYyHNYQXKdHMiEPDT2/3i6/FcJjDyp0UqDr1b3xLPCXxM/45E/
	7/EhwAlxvcAGZDWAztR9+RIlpB7FsQLkfgN97tS3UK2BP/irxIcAMuiDl+a4p1TW
	emScBDB4LUWj2cKZCm+He8P3YvAoHWZRtkFxolUQiy+E2PT5w3fbA6iogNbpn8dp
	DvoLXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj110xb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 08:14:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc0097865so104493421cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064895; x=1790669695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUVwl/Cqz9oHS9EDYzWm3E77+kKD/YiQILpCclthFpY=;
        b=DNHZ2xUeT8Rp9ULBGASsQ2YkTBJW09fFDm0wxIHQF58k+C14Di4ZXhoD7yp0p6l+QW
         Z24+GQLrtBZxKp86rVRlZGQtVBJ2T0kV+rA63x0MahsKfr6VjmVDrI02vfBgFQBurcLo
         Tu1FJXHThQC6uvlbRLyXu5nEzqve+DA3VnbqR6/AEsvfAP9WWUi6zkLCKabfmX/riRNU
         2b5wLWz7sPLY2Ew0oH/pF209/7zfR+Sep8b1KKXiib4Ak5tXBkqiVnIAET475JMSv4zZ
         +2ySwJkV/m7EF/c2aXiDq2o7EFqvAu4NUbNPM1BnCHF/t87O3WeYsPX6/31EkffpmTMz
         AfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064895; x=1790669695;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUVwl/Cqz9oHS9EDYzWm3E77+kKD/YiQILpCclthFpY=;
        b=oZ1I8pqfl1nEPpC0UF3ZSXFbLHsODpaVKndQ8jZLqP2Aka3pVnXy9+tdxppfjL8fgG
         K2yLmSJ3kA59yu1MGXd+AE8/nqrKwwXIRZAHk0i+3Hs7YW6VTS7jHNHYi0QIBcMOsNw1
         2s/AHaPLSogcOjT1FFgQbv9Yzg0QFYSB2dOMXPYVqFelwb7AC6Xv5JHy+sc0NxE5dFbC
         r9t27CjXaMH7CrlYA5lO7dOp0hVniWKbcitZ+gWD5dAa8UAbQftgxCGeIn3W1MpRbG+Z
         1YVtOSTSvqi/RpiIWL5ddcstxDP9t2kc+e6cKETy7hBZ+/UJAof2xZ7qycWdxl/y/LUI
         0hqg==
X-Forwarded-Encrypted: i=1; AKwUvBzSaziACnIYx96+8BSjnGZKJiA/F0UIBkQZ/Q9vq1HGx/VbBggYT71ogMxqPrqUVz44y+UNYmEk8LsO@vger.kernel.org
X-Gm-Message-State: AFuF++nbYCSk6GHnZMhNz+v/VR7x7DdxOvUMqUqc4L4OGNWkEgL+i2os
	13CzkCWYaZa0qgxJ3I0bkCQCe8DVodS3qSt1zv41CHfrqw/Yx01HmTA1otqmojhzlC83GqIxkIW
	A8AuCQrdmbIEbwBU/PsSdNkIzWCkpWM7W0wFqFSM3Sq/HVfjt0SY18bx/XffuPsFu
X-Gm-Gg: AYBFou1JxOqswzASjAw/UYpmeLT53yKZuc8fBSiaoCAZJ+7+oFxRT2/pSm1BCr9UHAc
	zaPVs+UEkW27i+7L7N0YkGozvre20fi/ZpT1zWKu/tFu/l2kwx1wAGnO5CYTZgUGmDUk96Htucs
	W5O3mAKw4ORZYVWCe6des0t0cf3qBF9hH6OO1cGBCRK7gUWFp9oyGnW/OUrIWDW/SGoco8jcSmW
	mqxOPRot/xBvb/HajLx5lRx8xmxS6vknZAfJYpSO1EAQQg4B3jxE+QHDCQqUvFzENHOfpf6zQKO
	tOZIZAxQ9zII4jILuxWLtakBIdCTx7f+UbEdgI6AaB24QRKvES4XN8QZiK9TWkoqqW0BjCcN1w3
	xlJPTlMZhzhsxvf4lhwzstUhzuw==
X-Received: by 2002:a05:620a:2b88:b0:939:4a34:621e with SMTP id af79cd13be357-93c15dd29camr428479085a.28.1790064895465;
        Tue, 22 Sep 2026 01:14:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2b88:b0:939:4a34:621e with SMTP id af79cd13be357-93c15dd29camr428477785a.28.1790064895059;
        Tue, 22 Sep 2026 01:14:55 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaec8ebsm29624705e9.2.2026.09.22.01.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:14:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Gilberto Conde <gilbertorconde@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13
Date: Tue, 22 Sep 2026 10:14:51 +0200
Message-ID: <179006480189.5296.14114612029159651511.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921093419.2870168-1-gilbertorconde@gmail.com>
References: <20260921093419.2870168-1-gilbertorconde@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gmS7ovybMrOvw1FKu4vMklDh7ltA0vZm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX1G176VJkcYIN
 kKXXKhLH29Kpgua9oNmm4N3zlALtQg2LO4kATKgOZfV0RRiI4TAuQ1Dg49iBpfZfwGhlnN4PoC6
 qB0WUqZNO9xW3ntDHVdm2clid/AOahs=
X-Proofpoint-ORIG-GUID: gmS7ovybMrOvw1FKu4vMklDh7ltA0vZm
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab23900 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ywFeef63eliSz_rKYaIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX+Zs00CkOgYwF
 X6Zp8/kAgUKrZs8iySUR3DU8t411WqKcs5ylWzRUjphwicbFpX/2LT9odFpnU2HrQMUMYX6JPJ1
 lmOyv/iGEr6GWTvgXSQzHcflTv7Fn0PAp5Azp7k0Phc1aguu39lBQ356utY+WCuFinjQaNDT20J
 tcHkIYj11EHo1qxSsqJvMiXNeg6qc6sS2nHviv9vX+PaQjmR2RcVoTnTUy6aPQrsy8m5BqQUC41
 1UtgmPGzKjX0br7PjcRERpiiVNJkGps/b1Mno1vbLyqEA8z7sH2ySj9a88kymKMp2Qpb6UCq+bK
 tGHhQJWS2z1i4w5PIFBcSTXy77jv1q8ce+rJhR8kNwxNx4pnPGDWSvkWxGXHOJSo2rqsmvk5nyx
 cfRnz145zWmplug69YJsvq2uoTarzlzL/FeG3pAAvG9SvrT7B/xnfQ6cXebjfUzh8q8YgosE79B
 OppMTcwzQgwoH5ZGe7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220118


On Mon, 21 Sep 2026 10:34:19 +0100, Gilberto Conde wrote:
> GPIO13 supports the PWM3 function at mux select value 4, but the
> pingroup table leaves that slot empty and gpio13 is not listed in
> pwm3_groups. Selecting pwm3 on gpio13 is therefore rejected by the
> pinmux core:
> 
>   ipq5018-tlmm: invalid group "gpio13" for function "pwm3"
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13
      https://git.kernel.org/brgl/c/c6c159fcdb4e9a678eda0831f971e4a3a488ec47

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
