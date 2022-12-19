//
//  ProfilePhotoSelectorView.swift
//  SwiftUIChat
//
//  Created by Ayi on 2022/12/16.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            NavigationLink(
                destination: MainTabView(),
                isActive: $viewModel.didUploadPhoto,
                label: { })

            Button(action: { imagePickerPresented.toggle() }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.blue)
                }
            })
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
            })

            Text(profileImage == nil ? "Select a profile photo" : "Great! Tap below to continue")
                .font(.system(size: 20, weight: .semibold))

            if let image = selectedImage {
                Button(action: {
                    viewModel.uploadProfileImage(image)
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(Color.theme.whiteColor)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                .padding(.top, 24)
            }

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }

    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

// Preview missing environment of type: AuthViewModel. To resolve this add .environmentObject(AuthViewModel(...)) to the appropriate preview.
//struct ProfilePhotoSelectorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePhotoSelectorView()
//    }
//}
