function PatchConfiguration(xp,yp,config)
    if config==1
        Xp=[xp-5 xp+5 xp+5 xp-5];
        Yp=[yp-15 yp-15 yp+15 yp+15];
%         hold on
        patch(Xp,Yp,'g','FaceAlpha',0.3,'EdgeColor','b');
    elseif config==2
        Xp=[xp-15 xp+15 xp+15 xp-15];
        Yp=[yp-5 yp-5 yp+5 yp+5];
%         hold on
        patch(Xp,Yp,'g','FaceAlpha',0.3,'EdgeColor','b');
    end
end